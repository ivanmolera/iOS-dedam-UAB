//
//  ViewController.m
//  Session
//
//  Created by IVAN MOLERA on 15/1/17.
//  Copyright © 2017 UAB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    title = @"title";
    author = @"author";
    thumbnail = @"thumbnail";
    
    _myBooks = [[NSMutableArray alloc] init];
    
    _isPageRefreshing = NO;
    _page = 1;
    [self makeRequest:_page];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_myBooks count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"Item";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell != nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:identifier];
    }
    
    NSDictionary *tmpDict = [_myBooks objectAtIndex:indexPath.row];
    
    NSMutableString *text = [NSMutableString stringWithFormat:@"%@", [tmpDict objectForKey:@"title"]];
    NSMutableString *details = [NSMutableString stringWithFormat:@"%@", [tmpDict objectForKey:@"author"]];
    NSMutableString *image = [NSMutableString stringWithFormat:@"%@", [tmpDict objectForKey:@"thumbnail"]];
    
    
    // Usamos un thread en segundo plano para descargar las imágenes y mejorar la experiencia del usuario
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        // Download imágenes
        NSURL *url = [NSURL URLWithString:image];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:imageData];
        
        // Los cambios en las vistas se realizan en el main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            // Refresh image view here
            [cell.textLabel setText:text];
            [cell.detailTextLabel setText:details];
            [cell.imageView setFrame:CGRectMake(0, 0, 80, 70)];
            [cell.imageView setImage:img];
        });
    });
    
    return cell;
}

- (void)makeRequest:(int)page {
    
    NSString *stringURL = [NSString stringWithFormat:@"http://squash.appchana.com/dao/foo.php?page=%d", page];
    NSURL *url = [NSURL URLWithString:stringURL];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingMutableContainers
                                                       error:nil];
    
    NSDictionary *booksData = (NSDictionary *)jsonObjects;
    
    NSArray *books = [booksData objectForKey:@"books"];

    if([[books lastObject] count] > 0) {
        [_myBooks addObjectsFromArray:books];
        _isPageRefreshing = NO;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.tableView.contentOffset.y >= (self.tableView.contentSize.height - self.tableView.bounds.size.height)) {
        if(!_isPageRefreshing) {
            _isPageRefreshing = YES;

            [self makeRequest:_page++];
            [self.tableView reloadData];

            NSLog(@"page = %d", _page);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

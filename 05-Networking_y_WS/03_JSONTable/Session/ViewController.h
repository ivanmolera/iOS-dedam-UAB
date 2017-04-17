//
//  ViewController.h
//  Session
//
//  Created by IVAN MOLERA on 15/1/17.
//  Copyright © 2017 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSString *title;
    NSString *thumbnail;
    NSString *author;
}

@property (nonatomic, strong) NSMutableArray *myBooks;
@property (nonatomic, assign) BOOL isPageRefreshing;
@property (nonatomic, assign) int page;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end


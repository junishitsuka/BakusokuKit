//
//  LeftViewController.h
//  BakusokuKit
//
//  Created by ishitsuka.jun on 2014/08/28.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "ViewController.h"

@interface LeftViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UILabel *textLabel;
    NSArray *dataSource;
    __strong LoginViewController *_loginViewController;
    __strong ViewController *_viewController;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

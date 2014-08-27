//
//  LeftViewController.m
//  BakusokuKit
//
//  Created by ishitsuka.jun on 2014/08/28.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import "LeftViewController.h"
#import "ViewController.h"
#import "IIViewDeckController.h"
#import "LoginViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _loginViewController = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
        // _loginViewController.delegate = self;
        _viewController = [[ViewController alloc] initWithNibName:nil bundle:nil];
        // _viewController.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dataSource = @[@"",@"ホーム", @"ログイン", @"設定",@"爆速Kitについて"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // NSLog([dataSource objectAtIndex:[indexPath row]]);
    // ViewController *viewController =[[ViewController alloc] init];
    // [viewController didFinishToggleLeftView: [indexPath row]];
    
    // [self.viewDeckController.centerController selectedSideBar] = [indexPath row];
    // self.viewDeckController.closeLeftView;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
        UINavigationController *navigationController = (UINavigationController *) controller.centerController;
        self.viewDeckController.centerController = _loginViewController;
        
        if (self.viewDeckController.centerController) {
            [navigationController setViewControllers: @[_loginViewController, _viewController]];
        }
    }];
}

@end

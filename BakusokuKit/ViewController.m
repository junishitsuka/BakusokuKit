//
//  ViewController.m
//  BakusokuKit
//
//  Created by Ishitsuka Jun on 2014/08/13.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import "ViewController.h"
#import "IIViewDeckController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.menuBotton.target = self.viewDeckController;
    self.menuBotton.action = @selector(toggleRightView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

@end

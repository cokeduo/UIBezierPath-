//
//  ViewController.m
//  UIBezierPathTest
//
//  Created by change009 on 16/3/7.
//  Copyright © 2016年 change009. All rights reserved.
//

#import "ViewController.h"
#import "PathView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PathView *MyPathView = [[PathView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:MyPathView];
    
}


@end

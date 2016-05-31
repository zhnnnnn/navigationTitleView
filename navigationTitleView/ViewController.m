//
//  ViewController.m
//  navigationTitleView
//
//  Created by zhn on 16/5/31.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+coolStyle.h"
#import "secondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar zhn_setBackGroundAlpha:0.3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)pushVC:(id)sender {
    
    secondViewController * secondVC = [[secondViewController alloc]init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end

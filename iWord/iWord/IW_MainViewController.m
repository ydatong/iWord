//
//  ViewController.m
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_MainViewController.h"
#import "IW_WordAPITool.h"

@interface IW_MainViewController ()

@end

@implementation IW_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[IW_WordAPITool sharedTool] queryWord:@"hello" withApiType:IWApiTypeYouDao resultHandle:^(IW_WordBaseModel *resultModel, NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

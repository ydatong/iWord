//
//  TodayViewController.m
//  iWordWidget
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "IW_DBManager.h"
#import "IW_WordBaseModel.h"
#import "IW_WordAPITool.h"
#import "IW_SharedTool.h"
#import "AFNetworking.h"


@interface TodayViewController () <NCWidgetProviding>

{
    
    __weak IBOutlet UITextView *explainTextView;

}

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pasteboardChanged:) name:UIPasteboardChangedNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    NSString *word = [UIPasteboard generalPasteboard].string;
    NSString *savedWord = [[NSUserDefaults standardUserDefaults] valueForKey:@"savedWord"];
    if (word) {
        if (savedWord && [word isEqualToString:savedWord]) {
            return;
        }
        [[NSUserDefaults standardUserDefaults] setObject:word forKey:@"savedWord"];
        [[IW_WordAPITool sharedTool] queryWord:word resultHandle:^(IW_WordBaseModel *resultModel, NSError *error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                explainTextView.text = resultModel.explainString;
            });
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}


- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake(0, 200);
    }else{
        self.preferredContentSize = CGSizeMake(0, 300);
    }
}

- (void)pasteboardChanged:(NSNotification*)notif {
    
    
}

- (IBAction)queryWord:(id)sender {
    
    
}


- (IBAction)openWordList:(id)sender {
    
}

@end

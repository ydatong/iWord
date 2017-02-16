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
    IBOutlet UITextView *compactExplainTextView;
    IBOutlet UIButton *wordlistBtn;
    IBOutlet UIButton *queryWordBtn;
    IBOutlet UILabel *wordLabel;
    IW_WordBaseModel *currentWord;
}

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    compactExplainTextView.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pasteboardChanged:) name:UIPasteboardChangedNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    NSString *word = [UIPasteboard generalPasteboard].string;
    if (!word) {
        word = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedWord"];
        if (!word) {
            word = @"test";
        }
    }
    wordLabel.text = word;
    [[NSUserDefaults standardUserDefaults] setObject:word forKey:@"savedWord"];
    [[IW_WordAPITool sharedTool] queryWord:word resultHandle:^(IW_WordBaseModel *resultModel, NSError *error) {
        
        currentWord = resultModel;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.extensionContext.widgetActiveDisplayMode == NCWidgetDisplayModeCompact) {
                compactExplainTextView.text = resultModel.compactExplainString;
            }else{
                explainTextView.text = resultModel.explainString;
            }
        });
        
    }];
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
        self.preferredContentSize = maxSize;
        compactExplainTextView.hidden = NO;
        explainTextView.hidden = YES;
        queryWordBtn.hidden = YES;
        wordlistBtn.hidden = YES;
    }else{
        self.preferredContentSize = CGSizeMake(maxSize.width, 200);
        compactExplainTextView.hidden = YES;
        explainTextView.hidden = NO;
        queryWordBtn.hidden = NO;
        wordlistBtn.hidden = NO;
    }
    
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        compactExplainTextView.text = currentWord.compactExplainString;
    }else{
        explainTextView.text = currentWord.explainString;
    }
}

- (void)pasteboardChanged:(NSNotification*)notif {
    
    
}

- (IBAction)queryWord:(id)sender {
    
    [self.extensionContext  openURL:[NSURL URLWithString:@"todaywidget://query" ]completionHandler:nil];
}


- (IBAction)openWordList:(id)sender {
    
    [self.extensionContext  openURL:[NSURL URLWithString:@"todaywidget://list" ]completionHandler:nil];
}

- (IBAction)showWordExplain:(id)sender {

    [self.extensionContext  openURL:[NSURL URLWithString:@"todaywidget://explain" ]completionHandler:nil];
}

@end

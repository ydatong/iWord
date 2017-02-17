//
//  IW_WordSearchController.m
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_WordSearchController.h"
#import "IW_WordView.h"
#import "IW_WordAPITool.h"

@interface IW_WordSearchController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

{
    IW_WordView *_wordView;
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet UITextField *_inputTextField;
    NSString *_word;
    IWApiType _ApiType;
}

@end

@implementation IW_WordSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    [DefaultNotificationCenter addObserver:self selector:@selector(appLanuchdByTodayWidget:) name:kAppDidLanuchedByTodayWidget object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)appLanuchdByTodayWidget:(NSNotification*)noti {
    
    [self handleAppLanuchByTodayWidget];
}

//切换字典
- (IBAction)switchApi:(id)sender {
    
//    IWApiType apiType = 
}

#pragma mark - UI

- (void)setupUI {
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _wordView = [[[UINib nibWithNibName:@"IW_WordView" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
    _wordView.frame = CGRectMake(0, 0, self.view.frame.size.width, 400);
    _tableView.tableHeaderView = _wordView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnView:)];
    [self.view addGestureRecognizer:tap];
    
    _ApiType = IWApiTypeYouDao;
}

- (void)tapOnView:(UITapGestureRecognizer*)tap {
    
    [_inputTextField resignFirstResponder];
}

//从today widget启动app
- (void)handleAppLanuchByTodayWidget {
    
    if ([IW_AppManager defaultManager].launchType) {
        switch ([IW_AppManager defaultManager].launchType) {
            case IW_LaunchTypeQuery:
            {
                [_inputTextField becomeFirstResponder];
            }
                break;
            case IW_LaunchTypeList:
            {
                
            }
                break;
            case IW_LaunchTypeExplain:
            {
                [[IW_WordAPITool sharedTool] queryWord:@"test"
                                          resultHandle:^(IW_WordBaseModel *resultModel, NSError *error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [_wordView setWordModel:resultModel];
                    });
                }];
            }
                break;
                
            default:
                break;
        }
    }
}


#pragma mark - UITableView Delegate & Datasource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 250;
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    _word = textField.text;
    [[IW_WordAPITool sharedTool] queryWord:_word
                               withApiType:_ApiType
                              resultHandle:^(IW_WordBaseModel *resultModel, NSError *error) {
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                     [_wordView setWordModel:resultModel];
                                  });
                              }];
    
    return YES;
}
@end

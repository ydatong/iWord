//
//  IW_WordView.h
//  iWord
//
//  Created by kanewang on 2017/2/15.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IW_WordBaseModel.h"

@interface IW_WordView : UIView

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UILabel *ukLabel;
@property (weak, nonatomic) IBOutlet UILabel *amLabel;
@property (weak, nonatomic) IBOutlet UITextView *explainTxtView;
@property (weak, nonatomic) IBOutlet UIButton *ukBtn;
@property (weak, nonatomic) IBOutlet UIButton *amBtn;

- (void)setWordModel:(IW_WordBaseModel*)wordModel;


@end

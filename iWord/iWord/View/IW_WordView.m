//
//  IW_WordView.m
//  iWord
//
//  Created by kanewang on 2017/2/15.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_WordView.h"

@implementation IW_WordView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


//添加到单词本
- (IBAction)addToWordList:(id)sender {
    
}

//播放英式发音
- (IBAction)playUkMp3:(id)sender {
    
}

//播放美式发音
- (IBAction)playAmMp3:(id)sender {
    
}


- (void)setWordModel:(IW_WordBaseModel*)wordModel {
    
    _wordLabel.text = wordModel.word;
    _ukLabel.text = wordModel.phoneticUK;
    _amLabel.text = wordModel.phoneticAM;
    _explainTxtView.text = wordModel.explainString;
    
}


@end

//
//  StarView.h
//  WXMovie
//
//  Created by 周小立 on 16/8/26.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    //金色✨
    UIView *_yellowView;
    //灰色✨
    UIView *_grayView;
}
@property(nonatomic,assign)CGFloat rating;//评分
@end

//
//  PhotoScrollView.h
//  WXMovie
//
//  Created by 周小立 on 16/8/30.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imgView;//用来玩的图片(放大，缩小)
}
@property(nonatomic,strong)NSURL *url;
@end

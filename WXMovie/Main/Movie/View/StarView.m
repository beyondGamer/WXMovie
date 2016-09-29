//
//  StarView.m
//  WXMovie
//
//  Created by 周小立 on 16/8/26.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"
@implementation StarView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建子视图
        [self _createView];
        
    }
    return self;
}
//如果有xib文件存在的情况下，这个方法会自动调用，这里写的我们要考虑周全一点
-(void)awakeFromNib{
    [self _createView];
}
-(void)_createView{
    UIImage *yellowImg = [UIImage imageNamed:@"yellow"];
    UIImage *grayImg = [UIImage imageNamed:@"gray"];
    
    //1.创建灰色星星
    _grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayImg.size.width * 5, grayImg.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    [self addSubview:_grayView];
    //2.创建黄色星星
    _yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowImg.size.width * 5, yellowImg.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    [self addSubview:_yellowView];
    
    //3.设置当前视图的宽度为5个星星的宽度
    CGFloat star5Width = yellowImg.size.width * 5;
    
//    CGRect frame = self.frame;
//    frame.size.width = star5Width;
//    self.frame = frame;
    //等价于
    self.width = star5Width;
    
    
    CGFloat scale = self.frame.size.height / yellowImg.size.height;
    NSLog(@"%1f",scale);
    //放大星星(原图星星太小)
    CGAffineTransform t = CGAffineTransformMakeScale(scale, scale);
    _grayView.transform = t;
    _yellowView.transform = t;
    
    //重新修改起始点(星星放大后位置会发生变化)
//    CGRect f1 = _grayView.frame;
//    CGRect f2 = _yellowView.frame;
//    f1.origin = CGPointZero;
//    f2.origin = CGPointZero;
//    _grayView.frame = f1;
//    _yellowView.frame = f2;
    //等价于
    _grayView.origin = CGPointZero;
    _yellowView.origin = CGPointZero;
    
    //给当前视图一个透明背景，便于观察
    self.backgroundColor = [UIColor clearColor];
    
}
//保证设置星星的时候，rating已经存在
-(void)setRating:(CGFloat)rating{
    _rating = rating;
    
    //1.计算分数的百分比
    CGFloat s = rating / 10.0;
    //2.黄色视图的宽度进行相应的变化
    
    //1)先修改黄色星星的宽度（这边注意，我们要用已经改变了的宽度进行设置）
    CGFloat width = self.frame.size.height / [UIImage imageNamed:@"yellow"].size.height
    *[UIImage imageNamed:@"yellow"].size.width * 5 *s;
    NSLog(@"----%f",width);
    CGFloat width2 = self.frame.size.width * s;
    NSLog(@"------%f",width2);
    //2)设定黄色星星的宽度
    _yellowView.width = width;
    
    
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

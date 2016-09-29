//
//  PhotoCell.m
//  WXMovie
//
//  Created by 周小立 on 16/8/30.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "PhotoCell.h"
#import "PhotoScrollView.h"
@implementation PhotoCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _scrolView = [[PhotoScrollView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_scrolView];
    }
    return self;
}
-(void)setUrl:(NSString *)url{
    if (_url != url) {
        _url = url;
        
        _scrolView.url = [NSURL URLWithString:url];
        
    }
}
@end

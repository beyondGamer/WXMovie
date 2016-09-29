//
//  IndexCell.m
//  WXMovie
//
//  Created by user on 16/9/8.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "IndexCell.h"
#import "Movie.h"
@implementation IndexCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self _createImgeView];
    }
    return self;
}
-(void)_createImgeView{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.size.width * 0.95, self.contentView.size.height * 0.95)];
    _imgView.center = self.contentView.center;
    
    [self.contentView addSubview:_imgView];

}

-(void)setMovie:(Movie *)movie{

    if (_movie != movie) {
        _movie = movie;
        
        [_imgView sd_setImageWithURL:[NSURL URLWithString:[movie.images objectForKey:@"large"]]];
        
        
    }

}

@end

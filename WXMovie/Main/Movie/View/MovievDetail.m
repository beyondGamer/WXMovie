//
//  MovievDetail.m
//  WXMovie
//
//  Created by user on 16/9/8.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "MovievDetail.h"
#import "Movie.h"
#import "StarView.h"
@implementation MovievDetail
-(void)setMovie:(Movie *)movie{
    if (_movie != movie) {
        _movie = movie;
        [__images sd_setImageWithURL:[NSURL URLWithString:[movie.images objectForKey:@"medium"]]];
        
        __title.text = movie.title;
        
        __orignTitle.text = movie.original_title;
        
        __year.text = movie.year;
        
        __rating.text = [NSString stringWithFormat:@"%.1f",[movie.average floatValue]];
        
        _star.rating = [movie.average floatValue];
        
        
        
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

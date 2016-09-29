//
//  TopDetailCell.m
//  WXMovie
//
//  Created by user on 16/9/9.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "TopDetailCell.h"
#import "Top.h"
@implementation TopDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setTop:(Top *)top{
    if (_top != top) {
        _top = top;
        [_iconImage sd_setImageWithURL:[NSURL URLWithString:_top.userImage]];
        _rating.text = _top.rating;
        
        _userName.text = _top.nickname;
        
        _content.text = _top.content;
        
        
        
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

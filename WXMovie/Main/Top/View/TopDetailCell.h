//
//  TopDetailCell.h
//  WXMovie
//
//  Created by user on 16/9/9.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Top;
@interface TopDetailCell : UITableViewCell{

    __weak IBOutlet UIImageView *_iconImage;
    __weak IBOutlet UILabel *_userName;

    __weak IBOutlet UILabel *_rating;
    __weak IBOutlet UILabel *_content;
}
@property(nonatomic,strong)Top *top;
@end

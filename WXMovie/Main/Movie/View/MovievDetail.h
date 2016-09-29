//
//  MovievDetail.h
//  WXMovie
//
//  Created by user on 16/9/8.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class Movie;
@interface MovievDetail : UIView
@property (weak, nonatomic) IBOutlet UIImageView *_images;
@property (weak, nonatomic) IBOutlet UILabel *_title;
@property (weak, nonatomic) IBOutlet UILabel *_orignTitle;
@property (weak, nonatomic) IBOutlet UILabel *_year;
@property (weak, nonatomic) IBOutlet UILabel *_rating;
@property (weak, nonatomic) IBOutlet StarView *star;
@property(nonatomic,strong)Movie *movie;
@end

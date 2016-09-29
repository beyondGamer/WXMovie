//
//  IndexCell.h
//  WXMovie
//
//  Created by user on 16/9/8.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@interface IndexCell : UICollectionViewCell{
    UIImageView *_imgView;
}
@property(nonatomic,strong)Movie *movie;
@end

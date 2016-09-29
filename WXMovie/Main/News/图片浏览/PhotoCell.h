//
//  PhotoCell.h
//  WXMovie
//
//  Created by 周小立 on 16/8/30.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoScrollView;
@interface PhotoCell : UICollectionViewCell

@property(nonatomic,strong)PhotoScrollView *scrolView;
@property(nonatomic,copy)NSString *url;

@end

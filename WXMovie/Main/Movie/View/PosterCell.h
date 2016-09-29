//
//  PosterCell.h
//  WXMovie
//
//  Created by 周小立 on 16/8/31.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@class MovievDetail;
@interface PosterCell : UICollectionViewCell
{
    UIImageView *_imgView;
    
    MovievDetail *_detailView;//详情页面
    
    BOOL left;//判断是否翻转
}
@property(nonatomic,strong)Movie *movie;
@property(nonatomic,assign)BOOL isFilp;
//单元格的翻转方法
-(void)flipCell;
@end

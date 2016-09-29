//
//  PosterView.h
//  WXMovie
//
//  Created by 周小立 on 16/8/31.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PosterCollectionView;
@class IndexCollectionView;
@interface PosterView : UIView{
    //1.头部视图
    UIView *_headerView;
    
    //2.头部视图里面的索引海报视图
    IndexCollectionView *_indexcollectionView;
    //3.海报视图
    PosterCollectionView *_postercollectionView;
    //4.尾部视图
}
@property(nonatomic,strong)NSMutableArray *data;
@end

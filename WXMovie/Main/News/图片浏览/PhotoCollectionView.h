//
//  PhotoCollectionView.h
//  WXMovie
//
//  Created by 周小立 on 16/8/30.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSArray *urls;
@end

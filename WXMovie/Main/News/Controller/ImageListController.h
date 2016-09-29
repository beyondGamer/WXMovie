//
//  ImageListController.h
//  WXMovie
//
//  Created by 周小立 on 16/8/29.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "BaseViewController.h"

@interface ImageListController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    __weak IBOutlet UICollectionView *_collectionView;
    
}
@property(nonatomic,strong)NSMutableArray *data;

@end

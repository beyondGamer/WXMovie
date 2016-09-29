//
//  TopViewController.h
//  WXMovie
//
//  Created by 周小立 on 16/8/25.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "BaseViewController.h"
@class TopDetail;
@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    TopDetail * _topdetail;
    __weak IBOutlet UICollectionView *_collectionView;
}
@property(nonatomic,strong)TopDetail *topdetail;
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,assign)BOOL TopisFinsh;
@end

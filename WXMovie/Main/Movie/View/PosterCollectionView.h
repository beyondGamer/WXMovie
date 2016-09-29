//
//  PosterCollectionView.h
//  WXMovie
//
//  Created by 周小立 on 16/8/31.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCollectionView.h"
//在这里我们一定要实现布局对象的子协议，因为我们这里需要对collection进行布局（单元格的size）
@interface PosterCollectionView : ImageCollectionView

//<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
//
////我们这里需要设置单元格的大小，且其大小不能定死(为了代码的可扩展性),其宽度最好从外部传入
//@property(nonatomic,assign)CGFloat pageWidth;//一页宽度
//@property(nonatomic,strong)NSMutableArray *data;//接受posterview传递来的数据
//@property(nonatomic,assign)NSInteger currentItem;//记录当前选中的单元格


@end

//
//  ImageCollectionView.h
//  WXMovie
//
//  Created by user on 16/9/8.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

//我们这里需要设置单元格的大小，且其大小不能定死(为了代码的可扩展性),其宽度最好从外部传入
@property(nonatomic,assign)CGFloat pageWidth;//一页宽度
@property(nonatomic,strong)NSMutableArray *data;//接受posterview传递来的数据
@property(nonatomic,assign)NSInteger currentItem;//记录当前选中的单元格

@end

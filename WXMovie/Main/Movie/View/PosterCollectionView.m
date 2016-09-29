//
//  PosterCollectionView.m
//  WXMovie
//
//  Created by 周小立 on 16/8/31.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"
@implementation PosterCollectionView
{
    NSString *identify;
}

-(instancetype)initWithFrame:(CGRect)frame{
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //1.设置滚动方向
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    
//    flowLayout.minimumLineSpacing = 0;
    
    self = [super initWithFrame:frame];
//    if (self) {
//        //设置代理
//        self.delegate = self;
//        self.dataSource = self;
//        
//        //滚动条取消
//        self.showsHorizontalScrollIndicator = NO;
//        self.showsVerticalScrollIndicator = NO;
//        
////        self.pagingEnabled = YES;
//        
//        //设置scrollview的减速度范围(0-1)
//        self.decelerationRate = UIScrollViewDecelerationRateFast;
//        //注册单元格
//    }
//    self.contentInset =
    
    identify = @"PosterCell";
    [self registerClass:[PosterCell class] forCellWithReuseIdentifier:identify];
    //不能在这里设置单元格的整个的偏移量，因为我们要根据pagewidth属性取设置偏移量，那这个时候，在init方法里面，pagewidth属性还没有被赋值
//    flowLayout.sectionInset
    return self;
}
//设置单元格的左右偏移
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    CGFloat offsetX = (CGRectGetWidth(self.frame) - _pageWidth) / 2;
//    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
//    
//}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
////    scrollView.contentOffset.x;
//    NSLog(@"%f",scrollView.contentOffset.x);
//}

/*
 velocity:加速度
 targetContentOffset:目标偏移量(CGPoint类型的指针变量)
 */
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    NSLog(@"%f",velocity.x);
//    //最后停止下来时的偏移量
//    NSLog(@"目标偏移量:%f",targetContentOffset->x);
//    
//    //1.计算滑动停止的时候，单元格的索引位置
//    
//    int index = (targetContentOffset->x + _pageWidth /2) / _pageWidth;
//    
////    NSLog(@"currentItem = %li",_currentItem);
////    NSLog(@"%i",index);
////    if (self.currentItem == index && index < self.data.count - 1) {
////        if (velocity.x > 0.5) {
////            index ++;
////        }else if (velocity.x < -0.5 && index > 0){
////            index --;
////        }
////    }
//    //设置下一页的偏移量
//    targetContentOffset->x = index * _pageWidth;
//    
//    //4.记录当前页
//    self.currentItem = index;
//    
//}

#pragma mark - UICollectionViewDelegate
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    //先判断点击的单元格是不是当前选中单元格
//    if (self.currentItem == indexPath.item) {//是的话，翻转
//        //[单元格对象 翻转]
//        PosterCell *pCell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
//        [pCell flipCell];
//    }else{
//        //让选中的单元格居中显示
//        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//        //记录当前页
//        self.currentItem = indexPath.item;
//    }
//}

//返回单元格的尺寸
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(_pageWidth, CGRectGetHeight(self.frame));
//    
//}

#pragma mark - UICollectionViewDataSource
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.data.count;
//}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.movie  = self.data[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    PosterCell *cell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    if ([cell isFilp]) {
        [cell flipCell];
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

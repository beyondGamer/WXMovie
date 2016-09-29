//
//  ImageCollectionView.m
//  WXMovie
//
//  Created by user on 16/9/8.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "ImageCollectionView.h"
#import "PosterCell.h"
@implementation ImageCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumLineSpacing = 0;
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    if (self = [super initWithFrame:frame collectionViewLayout:flowlayout]) {
        self.delegate = self;
        self.dataSource = self;
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
    }
    
    return self;
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat offsetX = (CGRectGetWidth(self.frame) - _pageWidth) / 2;
    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"%f",velocity.x);
    //最后停止下来时的偏移量
    NSLog(@"目标偏移量:%f",targetContentOffset->x);
    
    //1.计算滑动停止的时候，单元格的索引位置
    
    int index = (targetContentOffset->x + _pageWidth /2) / _pageWidth;
    
    //    NSLog(@"currentItem = %li",_currentItem);
    //    NSLog(@"%i",index);
    //    if (self.currentItem == index && index < self.data.count - 1) {
    //        if (velocity.x > 0.5) {
    //            index ++;
    //        }else if (velocity.x < -0.5 && index > 0){
    //            index --;
    //        }
    //    }
    //设置下一页的偏移量
    targetContentOffset->x = index * _pageWidth;
    
    //4.记录当前页
    self.currentItem = index;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //先判断点击的单元格是不是当前选中单元格
    if (self.currentItem == indexPath.item) {//是的话，翻转
        //[单元格对象 翻转]
        PosterCell *pCell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [pCell flipCell];
    }else{
        //让选中的单元格居中显示
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //记录当前页
        self.currentItem = indexPath.item;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_pageWidth, CGRectGetHeight(self.frame));
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

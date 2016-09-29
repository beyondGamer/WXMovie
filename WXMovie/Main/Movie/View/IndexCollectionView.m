//
//  IndexCollectionView.m
//  WXMovie
//
//  Created by user on 16/9/8.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCell.h"
@implementation IndexCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
//    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc]init];
//    flowlayout.minimumLineSpacing = 0;
//    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    
//    if (self = [super initWithFrame:frame collectionViewLayout:flowlayout]) {
//        self.delegate = self;
//        self.dataSource = self;
//        
//        self.showsVerticalScrollIndicator = NO;
//        self.showsHorizontalScrollIndicator = NO;
//    }
    self = [super initWithFrame:frame];
    
    [self registerClass:[IndexCell class] forCellWithReuseIdentifier:@"indexCell"];
    return self;

}
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    CGFloat offsetX = (CGRectGetWidth(self.frame)-_pageWidth)/2;
//    
//    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
//
//}
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    int index = (targetContentOffset -> x + _pageWidth/2)/_pageWidth;
//    
//    
//    targetContentOffset ->x = index *_pageWidth;
//    
//    self.currentItem = index;
//
//}
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return _data.count;
//}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    IndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"indexCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.movie = self.data[indexPath.item];
    return cell;
    
    

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (self.currentItem == indexPath.item) {//是的话，翻转
//        //[单元格对象 翻转]
//        PosterCell *pCell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
//        [pCell flipCell];
    }else{
        //让选中的单元格居中显示
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //记录当前页
        self.currentItem = indexPath.item;
    }

}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(_pageWidth, CGRectGetHeight(self.frame));
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

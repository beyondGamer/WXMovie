//
//  PosterView.m
//  WXMovie
//
//  Created by 周小立 on 16/8/31.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
#define KHeaderViewHeight 100//头部视图的高度
#define KFooterViewHeight 35//尾部视图的高度
@implementation PosterView
{
    //半透明遮罩视图，这个视图要能够响应用户的点击事件
    UIControl *_maskView;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        //创建头部视图
        [self _createHeaderView];
        //创建中间大海报视图
        [self _createPosterCollectionView];
        //创建头部视图里面的索引海报
        [self _createIndexCollectionView];
    
        [_postercollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        
        [_indexcollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
    
    }
    return self;
}
#pragma  mark - 创建索引海报
-(void)_createIndexCollectionView{
    _indexcollectionView = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 100)];
    _indexcollectionView.backgroundColor = [UIColor clearColor];
    _indexcollectionView.pageWidth = 60;
    [_headerView addSubview:_indexcollectionView];
    



}
-(void)_createHeaderView{
    //1.创建头部视图
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0,64-100, KScreenWidth,130)];
    _headerView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_headerView];
    
    //2.设置背景图片
    UIImage *img = [UIImage imageNamed:@"indexBG_home"];
    
    //设置拉伸点
    img = [img stretchableImageWithLeftCapWidth:0 topCapHeight:2];//纵向拉伸
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 130)];
    imgView.image = img;
    imgView.tag = 500;
    imgView.userInteractionEnabled = YES;
    [_headerView addSubview:imgView];
    
    //3.创建箭头按钮
    UIButton *arrowsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [arrowsButton setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [arrowsButton setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    arrowsButton.frame = CGRectMake((KScreenWidth - 10)/2, 130 - 20, 15, 15);
    [_headerView addSubview:arrowsButton];
    [arrowsButton addTarget:self action:@selector(arrowsAction:) forControlEvents:UIControlEventTouchUpInside];
    arrowsButton.tag = 100;
    
    //4.创建向下轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_showHeaderView)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
//    UIPanGestureRecognizer
    //5.创建向上轻扫手势
    UISwipeGestureRecognizer *pan = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_hideHeaderView)];
    pan.direction = UISwipeGestureRecognizerDirectionUp;
    
//    pan.minimumNumberOfTouches = 2;
//    pan.maximumNumberOfTouches = 3;
    
    [self addGestureRecognizer:pan];
//
}
//2.创建海报视图
-(void)_createPosterCollectionView{
    /*
     中间海报视图的难点:1.分页的逻辑：这边不能够使用系统自带的分页逻辑，因为自带的分页逻辑一页就是一整个view的宽度，而我们这边只是一张图片(一个单元格的宽度)
     难点2:就是这个单元格的起始位置不是从原点开始的，而是从中间这个位置开始的，并且呢翻页的时候中间点的位置对应着上面中间的位置
     难点3:单页翻转
     综上所述，按照功能模块化的原则对collection子类化，将其封装，为了以后再次使用
     */
    _postercollectionView = [[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 64 + 30, KScreenWidth, self.height - 30 - KFooterViewHeight - 64 - 49)];
    
    //指定单元格的宽度
    _postercollectionView.pageWidth = 220;
    _postercollectionView.backgroundColor = [UIColor clearColor];
    [self insertSubview:_postercollectionView belowSubview:_headerView];
}

//传递数据给collectionview
-(void)setData:(NSMutableArray *)data{
    if (_data != data) {
        _data = data;
        [_postercollectionView setData:data];
        [_indexcollectionView setData:data];
        
    }
}
-(void)arrowsAction:(UIButton *)btn{
    btn.selected =! btn.selected;
    if (btn.selected == YES) {//展开
        [self _showHeaderView];
    }else{//收起
        [self _hideHeaderView];
    }
}
#pragma mark - 隐藏、显示头部视图
//展开
-(void)_showHeaderView{
    //添加动画效果
    [UIView animateWithDuration:.5 animations:^{
        _headerView.transform = CGAffineTransformMakeTranslation(0, KHeaderViewHeight);
    }];
    if (_maskView == nil) {
        //创建
        _maskView = [[UIControl alloc]initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
        [_maskView addTarget:self action:@selector(maskAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self insertSubview:_maskView belowSubview:_headerView];
        
        
    }
    _maskView.hidden = NO;
    
    //修改按钮的状态
    UIButton *arrowsButton = (UIButton *)[_headerView viewWithTag:100];
    arrowsButton.selected = YES;

    
}
-(void)_hideHeaderView{
    [UIView animateWithDuration:.5 animations:^{
        _headerView.transform = CGAffineTransformIdentity;
    }];
    _maskView.hidden = YES;
    
    //修改按钮的状态
    UIButton *arrowsButton = (UIButton *)[_headerView viewWithTag:100];
    arrowsButton.selected = NO;
}
-(void)maskAction:(UIControl *)contorl{
    [self _hideHeaderView];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"currentItem"]) {
        NSNumber * num = [change objectForKey:@"new"];
        NSInteger item = [num integerValue];
        if (object == _postercollectionView && _indexcollectionView.currentItem != item) {
            _indexcollectionView.currentItem = item;
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            [_indexcollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
            
        }else if(object == _indexcollectionView && _postercollectionView.currentItem != item){
            _postercollectionView.currentItem = item;
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            
            [_postercollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
            NSLog(@"1");
        
        
        }
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

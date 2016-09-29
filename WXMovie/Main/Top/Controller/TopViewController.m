//
//  TopViewController.m
//  WXMovie
//
//  Created by 周小立 on 16/8/25.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "TopViewController.h"
#import "Movie.h"
#import "TopCell.h"
#import "TopDetail.h"
@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self _requestData];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    // Do any additional setup after loading the view.
}
-(void)_requestData{
    //解析json数据
    NSDictionary *jsonDic = (NSDictionary *)[WXDataService requestData:top_250];
    _data = [NSMutableArray array];
    
    NSArray *array = [jsonDic objectForKey:@"subjects"];
    
    for (NSDictionary *dic in array) {
        Movie *movie = [[Movie alloc]init];
        
        movie.average = [[dic objectForKey:@"rating"]objectForKey:@"average"];
        movie.collect_count = [dic objectForKey:@"collect_count"];
        movie.images = [dic objectForKey:@"images"];
        movie.movieId = [dic objectForKey:@"id"];
        movie.title = [dic objectForKey:@"title"];
        movie.subtype = [dic objectForKey:@"subtype"];
        movie.year = [dic objectForKey:@"year"];
        movie.original_title = [dic objectForKey:@"original_title"];
        
        [_data addObject:movie];
        
    }
    //刷新数据
    [_collectionView reloadData];
}
#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"TopCell" forIndexPath:indexPath];
    cell.movie = self.data[indexPath.row];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _topdetail = [self.storyboard instantiateViewControllerWithIdentifier:@"TopDetail"];
    [self.navigationController pushViewController:_topdetail animated:YES];
    
    self.TopisFinsh = _topdetail.isFinsh;
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

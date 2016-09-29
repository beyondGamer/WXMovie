//
//  TopDetail.m
//  WXMovie
//
//  Created by user on 16/9/9.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "TopDetail.h"
#import "Top.h"
#import "TopDetailCell.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MPViewController.h"
#import "WXNavigationController.h"
#import "MainTabBarController.h"
@interface TopDetail (){
//    CGRect rect;
}

@end

@implementation TopDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    
    _table.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _table.delegate = self;
    _table.dataSource = self;
    
    
    // Do any additional setup after loading the view.
}
-(void)_loadData{
    _data = [NSMutableArray array];
    NSDictionary *detail = (NSDictionary *)[WXDataService requestData:@"movie_detail.json"];
    
    NSDictionary *comment = (NSDictionary *)[WXDataService requestData:@"movie_comment.json"];
    NSArray *commentArr = comment[@"list"];
    
    for (NSDictionary *dic in commentArr) {
        _top = [[Top alloc]init];
        _top.userImage = [dic objectForKey:@"userImage"];
        _top.nickname = [dic objectForKey:@"nickname"];
        _top.rating = [dic objectForKey:@"rating"];
        _top.content = [dic objectForKey:@"content"];
        
        [_data addObject:_top];
    }
    _top.images = detail[@"images"];
    _top.TopImage = detail[@"image"];
    
    _top.titleCn = detail[@"titleCn"];
    _top.titleEn = detail[@"titleEn"];
    _top.content = detail[@"content"];
    
    [_table reloadData];
    



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell" forIndexPath:indexPath] ;
        UIImageView *_imageView = [tableView viewWithTag:100];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:_top.TopImage]];
        
        UILabel *titleLabel = [tableView viewWithTag:101];
        titleLabel.text = _top.titleCn;
        
        UILabel *titlelabel = [tableView viewWithTag:102];
        
        titlelabel.text = _top.titleEn;
        
        UITextView *textView = [tableView viewWithTag:103];
        
        textView.text = _top.content;
        
        return cell;
        
    }else if (indexPath.row == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondCell" forIndexPath:indexPath];
        UIImageView *image1 = [tableView viewWithTag:200];
        
        [image1 sd_setImageWithURL:[NSURL URLWithString:_top.images[0]]];
        
        UIImageView *image2 = [tableView viewWithTag:201];
        
        [image2 sd_setImageWithURL:[NSURL URLWithString:_top.images[1]]];
        
        UIImageView *image3 = [tableView viewWithTag:202];
        
        [image3 sd_setImageWithURL:[NSURL URLWithString:_top.images[2]]];
        
        UIImageView *image4 = [tableView viewWithTag:203];
        
        [image4 sd_setImageWithURL:[NSURL URLWithString:_top.images[3]]];
        
        return cell;
    
    }else{
        TopDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TopDetailCell" forIndexPath:indexPath];
        
        cell.top = _data[indexPath.row - 2];
    
        return cell;
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 200;
    }else if (indexPath.row ==1){
        return 80;
    }else if([self.indexpath isEqual:indexPath]){
        Top *top = [[Top alloc]init];
        top = _data[indexPath.row-2];
        NSString *text = top.content;
        CGRect rect = [text boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
        
        if (rect.size.height + 50 <=100) {
            return  100;
        }else{
            return rect.size.height +50;
        }
        
    
    }

    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (![indexPath isEqual:self.indexpath] ) {
        self.indexpath = indexPath;
//    Top *top = [[Top alloc]init];
//    [_table reloadData];
        
    
        
    }else if([indexPath isEqual:self.indexpath]){
        self.indexpath = nil;
        
    
    }
    
    [_table reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    self.indexpath = nil;
//
//    [_table reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    if (indexPath.row ==1) {
        NSURL *url = [NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"];
        
        MPViewController *moviePlayer = [[MPViewController alloc]initWithContentURL:url];
        
        [self presentModalViewController:moviePlayer animated:YES];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tap:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    }
    
}
-(void)tap:(NSNotification *)noti{
    self.isFinsh = !self.isFinsh;
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

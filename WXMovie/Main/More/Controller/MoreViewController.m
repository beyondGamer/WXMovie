//
//  MoreViewController.m
//  WXMovie
//
//  Created by 周小立 on 16/8/25.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "MoreViewController.h"
#import "SDImageCache.h"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    [self countCasheSize];

}
-(void)countCasheSize{

    NSUInteger flieSize = [[SDImageCache sharedImageCache]getSize];
    
    _lost.text = [NSString stringWithFormat:@"%.1f",flieSize/1024/1024.0];

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"清空缓存" message:@"需要清理缓存吗？召唤师" delegate:self cancelButtonTitle:@"宝宝不要" otherButtonTitles:@"朕准了", nil];
        [alerView show];
//        alerView.delegate = self;
        
    }
    
    

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1) {
        [[SDImageCache sharedImageCache]clearDisk];
        [self countCasheSize];
    
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

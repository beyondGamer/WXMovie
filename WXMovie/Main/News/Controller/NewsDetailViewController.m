//
//  NewsDetailViewController.m
//  WXMovie
//
//  Created by 周小立 on 16/8/29.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createWebView];
    [self _loadData];
    // Do any additional setup after loading the view.
}
-(void)_createWebView{
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
//    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    _activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:_activityIndicator];
    
    self.navigationItem.rightBarButtonItem = buttonItem;
    

}
-(void)_loadData{

    NSDictionary *jsonDic = (NSDictionary *)[WXDataService requestData:@"news_detail.json"];
    NSString *content = [jsonDic objectForKey:@"content"];//新闻内容
    NSString *source = [jsonDic objectForKey:@"source"];//新闻来源
    NSString *time = [jsonDic objectForKey:@"time"];//新闻时间
    NSString *author = [jsonDic objectForKey:@"author"];//新闻作者
    NSString *title = [jsonDic objectForKey:@"title"];//新闻标题
    
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
//
    NSString *html = [NSString stringWithContentsOfFile:filePath encoding:4 error:nil];
//
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@",source,time];
//
    NSString *at = [NSString stringWithFormat:@"作者: %@",author];
//
    NSString *htmlString = [NSString stringWithFormat:html,title,subTitle,content,at];
    
    [_webView loadHTMLString:htmlString baseURL:nil];
}
- (void)dhtmlidReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityIndicator startAnimating];

}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIndicator stopAnimating];
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

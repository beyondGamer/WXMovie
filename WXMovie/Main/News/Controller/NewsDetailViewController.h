//
//  NewsDetailViewController.h
//  WXMovie
//
//  Created by 周小立 on 16/8/29.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface NewsDetailViewController : UIViewController<UIWebViewDelegate>{
    UIWebView *_webView;
    UIActivityIndicatorView * _activityIndicator;
}

@end

//
//  NewsViewController.h
//  WXMovie
//
//  Created by 周小立 on 16/8/25.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *data;
@end

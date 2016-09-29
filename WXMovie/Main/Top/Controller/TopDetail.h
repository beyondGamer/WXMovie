//
//  TopDetail.h
//  WXMovie
//
//  Created by user on 16/9/9.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Top;
@class MPViewController;
@interface TopDetail : UIViewController<UITableViewDelegate,UITableViewDataSource>{

    __weak IBOutlet UITableView *_table;


}
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,strong)Top *top;
@property(nonatomic,strong)NSIndexPath *indexpath;
@property(nonatomic,assign)BOOL isSelected;

@property(nonatomic,assign)BOOL isFinsh;
@end

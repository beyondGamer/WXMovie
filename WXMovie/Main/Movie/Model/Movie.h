//
//  Movie.h
//  WXMovie
//
//  Created by 周小立 on 16/8/26.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
/*
 电影model,和json数据里面的类型以及变量名要匹配
*/

//评分
@property(nonatomic,strong)NSNumber *average;
//标题
@property(nonatomic,copy)NSString *title;
//原标题
@property(nonatomic,copy)NSString *original_title;
//种类
@property(nonatomic,copy)NSString *subtype;
//年份
@property(nonatomic,copy)NSString *year;
//images
@property(nonatomic,copy)NSDictionary *images;
//电影id
@property(nonatomic,copy)NSString *movieId;
//收藏人数
@property(nonatomic,strong)NSNumber *collect_count;
@end

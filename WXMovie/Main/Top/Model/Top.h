//
//  Top.h
//  WXMovie
//
//  Created by user on 16/9/9.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface Top : BaseModel
@property(nonatomic,copy)NSString * TopImage;
@property(nonatomic,copy)NSString * titleCn;
@property(nonatomic,copy)NSString * titleEn;
@property(nonatomic,copy)NSString * content;
@property(nonatomic,copy)NSArray * images;
@property(nonatomic,copy)NSString * userImage;
@property(nonatomic,copy)NSString * nickname;
@property(nonatomic,copy)NSString * rating;
@property(nonatomic,copy)NSString * usercontent;

@end

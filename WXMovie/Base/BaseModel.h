//
//  BaseModel.h
//  WXMovie
//
//  Created by 周小立 on 16/8/29.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

-(id)initContentWithDic:(NSDictionary *)jsonDic;
-(void)setAttributes:(NSDictionary *)jsonDic;
-(NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic;
@end

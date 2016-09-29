//
//  BaseModel.m
//  WXMovie
//
//  Created by 周小立 on 16/8/29.
//  Copyright © 2016年 周小立. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(id)initContentWithDic:(NSDictionary *)jsonDic{
    self = [super init];
    if (self) {
        [self setAttributes:jsonDic];
    }
    return self;
}
-(void)setAttributes:(NSDictionary *)jsonDic{
    /*
     key : json字典的key名
     value:model对象的属性名
     */
    NSDictionary *mapDic = [self attributeMapDictionary:jsonDic];
    
    
    for (NSString *jsonKey in mapDic) {
        
        //modelArr:"newsId"
        //jsonKey:"id"
        
        NSString *modelArr = [mapDic objectForKey:jsonKey];
//        NSLog(@"modeArr = %@",modelArr);
        SEL seletor = [self stringToSel:modelArr];
        //判断self 是否有selector方法
        if ([self respondsToSelector:seletor]) {
            //json字典中的value
            id value = [jsonDic objectForKey:jsonKey];
            
            if ([value isKindOfClass:[NSNull class]]) {
                value = @"";
            }
            
            //调用属性的设置器方法，参数是json中的value
            [self performSelector:seletor withObject:value];
        }
    }
    
}
/*
 SEL类型的创建方式有两种:
 1.第一种:SEL selector = @selector(setNewsId:)
 2.第二种方式:SEL selector = NSSelectorFromString(setMethod)
 */
//newsid -> setNewsiD:
-(SEL)stringToSel:(NSString *)attName{
    //截取首字母
    NSString *first = [[attName substringToIndex:1]uppercaseString];
    NSString *end = [attName substringFromIndex:1];
    
    NSString *setMethod = [NSString stringWithFormat:@"set%@%@:",first,end];
//    NSLog(@"%@",setMethod);
    //将字符串转换成sel类型
    return NSSelectorFromString(setMethod);
    
    
}
//建立映射关系
/*
 key : json字典中的key名
 value : model对象的属性名
 */
-(NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic{
    
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
//    NSDictionary *mapDic = @{@"id":@"imageId"};
    
    
    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];

    }
//    NSLog(@"-----------%@",mapDic);
    return mapDic;
}
@end

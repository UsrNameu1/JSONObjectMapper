//
//  NSString+JSON.m
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/02.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)

+ (NSString *)stringWithJSONObject:(id)JSONObject
{
    NSError *error = nil;
    NSData *jsonData =
    [NSJSONSerialization dataWithJSONObject:JSONObject
                                    options:NSJSONWritingPrettyPrinted
                                      error:&error];
    
    if (error) {
        DebugLog(@"%@", error);
        return nil;
    } else {
        return [[self alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
    }
}

- (id)jsonObject
{
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    
    id jsonObject =
    [NSJSONSerialization JSONObjectWithData:jsonData
                                    options:NSJSONReadingAllowFragments
                                      error:&error];
    
    if (error) {
        DebugLog(@"%@", error);
        return nil;
    } else {
        return jsonObject;
    }
}

@end

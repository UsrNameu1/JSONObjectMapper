//
//  NSBundle+MYResource.m
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/02.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "NSBundle+MYResource.h"

@implementation NSBundle (MYResource)

- (NSString *)myModelJSONString
{
    static NSString *jsonString;
    
    if (!jsonString) {
        NSString *path = [self pathForResource:@"MYModel"
                                        ofType:@"json"];
        
        NSError *error = nil;
        jsonString =
        [NSString stringWithContentsOfFile:path
                                  encoding:NSUTF8StringEncoding
                                     error:&error];
        if (error) {
            DebugLog(@"%@", error);
        }
    }
    
    return jsonString;
}

@end

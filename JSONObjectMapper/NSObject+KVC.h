//
//  NSObject+KVC.h
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/02.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVC)

+ (NSArray *)allKeys;

- (id)propertyValueForKey:(NSString *)key;

- (NSDictionary *)dictionaryWithPropertyValuesForKeys:(NSArray *)keys;

@end

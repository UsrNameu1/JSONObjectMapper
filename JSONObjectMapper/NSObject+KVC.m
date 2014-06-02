//
//  NSObject+KVC.m
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/02.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "NSObject+KVC.h"

#import <objc/objc-runtime.h>

@implementation NSObject (KVC)

+ (NSArray *)allKeys
{
    u_int count;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertyArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        
        const char *propertyName = property_getName(property);
        [propertyArray addObject:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
    }
    
    free(properties);
    
    return [NSArray arrayWithArray:propertyArray];
}

- (id)propertyValueForKey:(NSString *)key
{
    const char *type = property_getAttributes(class_getProperty([self class], [key UTF8String]));
    NSString *typeString = [NSString stringWithUTF8String:type];
    NSArray *attributes = [typeString componentsSeparatedByString:@","];
    NSString *typeAttribute = attributes[0];
    NSString *propertyType = [typeAttribute substringWithRange:NSMakeRange(1, 1)];
    
    if ([propertyType isEqualToString:@(@encode(BOOL))]) {
        BOOL boolValue = [[self valueForKey:key] boolValue];
        return [NSNumber numberWithBool:boolValue];
    } else {
        return [self valueForKey:key];
    }
}

- (NSDictionary *)dictionaryWithPropertyValuesForKeys:(NSArray *)keys
{
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    for (NSString *key in keys) {
        id value = [self valueForKey:key];
        dictionary[key] = value;
    }
    
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end

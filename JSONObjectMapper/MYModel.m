//
//  MYModel.m
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/02.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYModel.h"

#import "NSObject+KVC.h"

@implementation MYModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self configureValuesWithDictionary:dictionary];
    }
    
    return self;
}

- (void)configureValuesWithDictionary:(NSDictionary *)dictionary
{
    for (NSString *key in dictionary) {
        if ([self respondsToSelector:NSSelectorFromString(key)]) {
            [self setValue:dictionary[key] forKey:key];
        }
    }
}

- (NSDictionary *)valueDictionary
{
    NSArray *allKeys = [[self class] allKeys];
    return [self dictionaryWithValuesForKeys:allKeys];
}

- (NSDictionary *)propertyValueDictionary
{
    NSArray *allKeys = [[self class] allKeys];
    return [self dictionaryWithPropertyValuesForKeys:allKeys];
}

- (NSString *)description
{
    NSMutableString *descriptionString = [NSMutableString new];
    
    [descriptionString appendString:[NSString stringWithFormat:@"base : %@\n", [super description]]];
    
    NSArray *allKeys = [[self class] allKeys];
    
    for (NSString *key in allKeys) {
        NSString *appendedString =
        [NSString stringWithFormat:@"%@ : %@ \n", key, [self propertyValueForKey:key]];
        [descriptionString appendString:appendedString];
    }
    
    return [NSString stringWithString:descriptionString];
}

@end

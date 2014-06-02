//
//  MYModel.h
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/02.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYModel : NSObject

@property (nonatomic) NSInteger identifier;

@property (nonatomic) BOOL canUpdate;

@property (nonatomic) CGFloat degree;

@property (nonatomic) NSNumber *number;

@property (nonatomic) NSString *name;

@property (nonatomic) NSArray *childs;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)valueDictionary;

@end

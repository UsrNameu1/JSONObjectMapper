//
//  MYViewController.m
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/02.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYViewController.h"

#import "NSBundle+MYResource.h"
#import "NSString+JSON.h"
#import "MYModel.h"

@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *jsonString = [[NSBundle mainBundle] myModelJSONString];
    NSDictionary *modelDictionary = jsonString.jsonObject;
    MYModel *model = [[MYModel alloc] initWithDictionary:modelDictionary];
    
    DebugLog(@"%@", model);
    DebugLog(@"%@",[NSString stringWithJSONObject:model.valueDictionary]);
    DebugLog(@"%@",[NSString stringWithJSONObject:model.propertyValueDictionary]);
}

@end

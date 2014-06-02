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

@interface MYViewController ()

@end

@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *jsonString = [[NSBundle mainBundle] myModelJSONString];
    NSDictionary *modelDictionary = jsonString.jsonObject;
    MYModel *model = [[MYModel alloc] initWithDictionary:modelDictionary];
    //DebugLog(@"%@",model);
    DebugLog(@"%@",[NSString stringWithJSONObject:model.valueDictionary]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

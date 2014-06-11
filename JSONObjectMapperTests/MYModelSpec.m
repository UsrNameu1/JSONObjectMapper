//
//  MYModelSpec.m
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/11.
//  Copyright 2014年 adachi.yuichi. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "MYModel.h"
#import "NSObject+KVC.h"


SPEC_BEGIN(MYModelSpec)

describe(@"MYModel", ^{
    __block MYModel *model;
    __block NSDictionary *mockModelInfo =
    @{@"canUpdate" : @(YES),
      @"childs" : @[@"daughter", @"son", @"musuco", @"musume"],
      @"degree" : @3.1,
      @"identifier" : @1122,
      @"name" : @"HOGEMOGE",
      @"number" : @5};
    
    beforeAll(^{
        model =
        [[MYModel alloc] initWithDictionary:mockModelInfo];
    });
    
    it(@"プロパティに値が代入されたモデルが生成される", ^{
        [[theValue(model.canUpdate) should] equal:mockModelInfo[@"canUpdate"]];
        [[model.childs should] beNonNil];
        [model.childs
         enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
             [[obj should] equal:mockModelInfo[@"childs"][idx]];
         }];
        [[theValue(model.degree) should] equal:theValue([mockModelInfo[@"degree"] floatValue])];
        [[theValue(model.identifier) should] equal:theValue([mockModelInfo[@"identifier"] integerValue])];
        [[model.name should] equal:mockModelInfo[@"name"]];
        [[theValue(model.number) should] equal:theValue(mockModelInfo[@"number"])];
    });
    
    it(@"モデルからマップされたDictionaryを作成する", ^{
        NSDictionary *modelDict = model.propertyValueDictionary;
        [[modelDict[@"canUpdate"] should] equal:mockModelInfo[@"canUpdate"]];
        [[modelDict[@"childs"] should] beKindOfClass:[NSArray class]];
        [modelDict[@"childs"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [[obj should] equal:mockModelInfo[@"childs"][idx]];
        }];
        [[theValue([modelDict[@"degree"] floatValue]) should] equal:theValue([mockModelInfo[@"degree"] floatValue])];
        [[theValue([modelDict[@"identifier"] integerValue]) should] equal:theValue([mockModelInfo[@"identifier"] integerValue])];
        [[modelDict[@"name"] should] equal:mockModelInfo[@"name"]];
        [[theValue([modelDict[@"number"] integerValue]) should] equal:theValue([mockModelInfo[@"number"] integerValue])];
    });
    
    it(@"propertyValueForKeyでBOOLを取得すると真偽値としてエンコーディングする", ^{
        [[theValue([[model propertyValueForKey:@"canUpdate"] objCType]) should] equal:theValue([@(YES) objCType])];
    });
    
    it(@"valueForKeyでBOOLを取得すると真偽値ではないタイプでエンコーディングする", ^{
        [[theValue([[model valueForKey:@"canUpdate"] objCType]) shouldNot] equal:theValue([@(YES) objCType])];
    });
});

SPEC_END

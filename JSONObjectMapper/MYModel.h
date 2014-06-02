//
//  MYModel.h
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/02.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  JSONと互換性のあるモデルクラス
 */
@interface MYModel : NSObject

@property (nonatomic) NSInteger identifier;

@property (nonatomic) BOOL canUpdate;

@property (nonatomic) CGFloat degree;

@property (nonatomic) NSNumber *number;

@property (nonatomic) NSString *name;

@property (nonatomic) NSArray *childs;

/**
 *  JSONからDictionaryを生成し、指定イニシャライザでインスタンス生成します。
 *
 *  @param dictionary JSONから生成されたDictionary
 *
 *  @return インスタンス
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 *  インスタンスの情報をマッピングしたDictionary
 *  内部ではdictionaryWithValuesForKeysを用いて情報を取得します。
 *
 *  @return インスタンスの情報
 */
- (NSDictionary *)valueDictionary;

/**
 *  インスタンスの情報をマッピングしたDictionary
 *  内部ではNSObject+KVCのdictionaryWithPropertyValuesForKeysを用いて情報を取得します。
 *
 *  @return インスタンスの情報
 */
- (NSDictionary *)propertyValueDictionary;

@end

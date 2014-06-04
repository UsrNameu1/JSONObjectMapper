//
//  NSObject+KVC.h
//  JSONObjectMapper
//
//  Created by adachi.yuichi on 2014/06/02.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  KVCを用いてNSObjectから各種情報を取り出すためのカテゴリ
 */
@interface NSObject (KVC)

/**
 *  オブジェクトの全てのプロパティのキーを返します。
 *
 *  @return 全てのキー文字列
 */
+ (NSArray *)allKeys;

/**
 *  BOOL値に関する処理を挟んだvalueForKeyメソッドです。値が存在しない場合は必ずNSNullを返します。
 *  BOOL値のエンコードはcharと同等であるため、charのプロパティを持つオブジェクトに対しては使用に注意を要します。
 *
 *  @param key キー文字列
 *
 *  @return プロパティのオブジェクト
 */
- (id)propertyValueForKey:(NSString *)key;

/**
 *  BOOL値に関する処理を挟んだdictionaryWithValuesForKeysメソッドです。
 *
 *  @param keys 全てのキー文字列
 *
 *  @return プロパティのオブジェクトとその名前をキーとする辞書
 */
- (NSDictionary *)dictionaryWithPropertyValuesForKeys:(NSArray *)keys;

@end

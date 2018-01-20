//
//  TWPersonDatabase.h
//  testWCDB
//
//  Created by TiltWang on 2017/9/18.
//  Copyright © 2017年 tilt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TWPerson;
@interface TWPersonDatabase : NSObject
//获得存放数据库文件的沙盒地址
+ (NSString *)wcdbFilePath;
//1.创建数据库的操作
+ (BOOL)creatDatabase;
#pragma mark - 增
+ (BOOL)insertData:(TWPerson *)person;
+ (BOOL)insertDatas:(NSArray<TWPerson *> *)persons;
#pragma mark - 删
+ (BOOL)deleteDataWithId:(NSInteger)pID;
+ (BOOL)deleteAllData;
#pragma mark - 改
+ (BOOL)updateData:(NSString *)name byId:(NSInteger)pID;
+ (BOOL)updateData:(TWPerson *)person;
#pragma mark - 查
+ (NSArray<TWPerson *> *)getAllData;
+ (NSArray<TWPerson *> *)getData:(NSInteger)pID;
#pragma mark - 删除整张表
+ (BOOL)dropTable;
@end

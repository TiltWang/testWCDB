//
//  TWPersonDatabase.mm
//  testWCDB
//
//  Created by TiltWang on 2017/9/18.
//  Copyright © 2017年 tilt. All rights reserved.
//

#import "TWPersonDatabase.h"
#import "TWPerson.h"
#import <WCDB/WCDB.h>

static WCTDatabase *database = nil;

@implementation TWPersonDatabase
//获得存放数据库文件的沙盒地址
+ (NSString *)wcdbFilePath
{
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [filePath objectAtIndex:0];
    NSString *dbFilePath = [documentPath stringByAppendingPathComponent:@"person.db"];
    NSLog(@"地址-- %@", dbFilePath);
    return dbFilePath;
}

//1.创建数据库的操作
+ (BOOL)creatDatabase
{
    database = [[WCTDatabase alloc] initWithPath:[self wcdbFilePath]];
    if (![database isTableExists:TABLE_WCDB_NAME]) {
        BOOL result = [database createTableAndIndexesOfName:TABLE_WCDB_NAME withClass:TWPerson.class];
        return result;
    }
    return YES;
}

#pragma mark - 增
+ (BOOL)insertData:(TWPerson *)person
{
    if (person == nil) {
        return NO;
    }
    if (database == nil) {
        [self creatDatabase];
    }
    //以下为c++数组添加方式
    WCTPropertyList list;//因为需要忽略主键,主键是自增的
    list.push_back(TWPerson.name);
    list.push_back(TWPerson.title);
    list.push_back(TWPerson.nickname);
    list.push_back(TWPerson.age);
    list.push_back(TWPerson.pindex);
    
    BOOL result = //[database insertObject:person into:TABLE_WCDB_NAME];//不忽略时用此方法
    [database insertObject:person onProperties:list into:TABLE_WCDB_NAME];
    
    
    return result;
}
+ (BOOL)insertDatas:(NSArray<TWPerson *> *)persons
{
    if (database == nil) {
        [self creatDatabase];
    }
    BOOL result = [database insertObjects:persons into:TABLE_WCDB_NAME];
    return YES;
}

#pragma mark - 删
+ (BOOL)deleteDataWithId:(NSInteger)pID
{
    if (database == nil) {
        [self creatDatabase];
    }
    BOOL result = [database deleteObjectsFromTable:TABLE_WCDB_NAME where:TWPerson.pID == pID];
    return result;
}
+ (BOOL)deleteAllData
{
    if (database == nil) {
        [self creatDatabase];
    }
    BOOL result = [database deleteAllObjectsFromTable:TABLE_WCDB_NAME];
    return result;
}

#pragma mark - 改
+ (BOOL)updateData:(NSString *)name byId:(NSInteger)pID
{
    if (database == nil) {
        [self creatDatabase];
    }
    TWPerson *person = [[TWPerson alloc] init];
    person.name = name;
    BOOL result =[database updateRowsInTable:TABLE_WCDB_NAME onProperty:TWPerson.name withValue:name where:TWPerson.pID == pID];
//    BOOL result = [database updateTable:TABLE_WCDB_NAME onProperties:TWPerson.name withRow:@[name] where:TWPerson.pID == pID];
    return result;
}
+ (BOOL)updateData:(TWPerson *)person
{
    if (database == nil) {
        [self creatDatabase];
    }
    BOOL result = [database updateAllRowsInTable:TABLE_WCDB_NAME onProperties:TWPerson.AllProperties withObject:person];
//    BOOL result = [database updateTable:TABLE_WCDB_NAME onProperties:TWPerson.AllProperties withObject:person];
    ///下面这些方法都失效了
//    BOOL result = [database updateTable:TABLE_WCDB_NAME onProperties:TWPerson.name withRow:@[person.name] where:TWPerson.pID == person.pID];
//    [database updateTable:TABLE_WCDB_NAME onProperties:TWPerson.age withRow:@[ [NSNumber numberWithInteger:person.age] ] where:TWPerson.pID == person.pID];
    return result;
}

#pragma mark - 查
+ (NSArray<TWPerson *> *)getAllData
{
    if (database == nil) {
        [self creatDatabase];
    }
    return [database getAllObjectsOfClass:TWPerson.class fromTable:TABLE_WCDB_NAME];
}
+ (NSArray<TWPerson *> *)getData:(NSInteger)pID
{
    if (database == nil) {
        [self creatDatabase];
    }
    return [database getObjectsOfClass:TWPerson.class fromTable:TABLE_WCDB_NAME where:TWPerson.pID == pID];
}

+ (BOOL)dropTable {
    if (database == nil) {
        [self creatDatabase];
    }
    return [database dropTableOfName:TABLE_WCDB_NAME];
}

@end

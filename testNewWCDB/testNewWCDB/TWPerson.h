//
//  TWPerson.h
//  testWCDB
//
//  Created by TiltWang on 2017/9/18.
//  Copyright © 2017年 tilt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<WCDB/WCDB.h>
#define TABLE_WCDB_NAME @"person"

@interface TWPerson : NSObject<WCTTableCoding>
@property (nonatomic, assign) NSInteger pID;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) NSInteger pindex;

WCDB_PROPERTY(pID)
WCDB_PROPERTY(age)
WCDB_PROPERTY(name)
WCDB_PROPERTY(title)
WCDB_PROPERTY(nickname)
WCDB_PROPERTY(pindex)

@end

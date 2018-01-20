//
//  TWPerson.mm
//  testWCDB
//
//  Created by TiltWang on 2017/9/18.
//  Copyright © 2017年 tilt. All rights reserved.
//

#import "TWPerson.h"

@implementation TWPerson
WCDB_IMPLEMENTATION(TWPerson)
WCDB_SYNTHESIZE(TWPerson, pID)
WCDB_SYNTHESIZE(TWPerson, age)
WCDB_SYNTHESIZE(TWPerson, name)
WCDB_SYNTHESIZE(TWPerson, title)
WCDB_SYNTHESIZE(TWPerson, nickname)
WCDB_SYNTHESIZE(TWPerson, pindex)

//WCDB_PRIMARY(TWPerson, pID)
///主键自增升序
WCDB_PRIMARY_ASC_AUTO_INCREMENT(TWPerson, pID)
///升序索引
WCDB_INDEX_ASC(TWPerson, "person_indexSubfix", pindex)

@end

//
//  ClassObj.h
//  margicalMapping
//
//  Created by Mac on 13-9-16.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TeacherObj.h"
@interface ClassObj : NSObject
@property(nonatomic,copy)NSString *className;
@property(nonatomic,retain)NSNumber *studentsCount;
@property(nonatomic,assign)NSNumber *isGoodClass;
@property(nonatomic,copy)NSString *leaderName;
@property(nonatomic,retain)NSDate *createDate;
@property(nonatomic,retain)NSArray *studentMembers;
@property(nonatomic,retain)TeacherObj *teacher;
@end

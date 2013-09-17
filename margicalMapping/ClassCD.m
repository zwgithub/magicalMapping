//
//  ClassCD.m
//  margicalMapping
//
//  Created by Mac on 13-9-17.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import "ClassCD.h"


@implementation ClassCD

@dynamic name;
@dynamic studentsCount;
@dynamic isGoodClass;
@dynamic leaderName;
@dynamic createDate;
@dynamic studentMembers;
@dynamic teacher;
-(NSDictionary *)propertyNameMapping
{
    return @{@"name":@"name",
             @"count":@"studentsCount",
             @"isGoodClass":@"isGoodClass",
             @"leaderName":@"leaderName",
             @"createDate":@"createDate",
             @"students":@"studentMembers",
             @"englishTeacher":@"teacher"
             };
}
-(NSDictionary *)propertyTypeFormat
{
    return @{@"createDate":@"yyyy-MM-dd HH:mm",
             @"studentMembers":@"StudentCD",
               @"teacher":@"TeacherCD"
             };
}
@end

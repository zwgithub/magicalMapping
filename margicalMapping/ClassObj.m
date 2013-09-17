//
//  ClassObj.m
//  margicalMapping
//
//  Created by Mac on 13-9-16.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import "ClassObj.h"

@implementation ClassObj
-(NSDictionary *)propertyNameMapping
{
    return @{@"name":@"className",
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
           @"studentMembers":@"StudentObj",
           @"teacher":@"TeacherObj"
           };

}
@end

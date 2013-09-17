//
//  TeacherCD.m
//  margicalMapping
//
//  Created by Mac on 13-9-17.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import "TeacherCD.h"


@implementation TeacherCD

@dynamic name;
@dynamic age;
-(NSDictionary *)propertyNameMapping
{
    return @{@"name":@"name",
             @"age":@"age"};
}

@end

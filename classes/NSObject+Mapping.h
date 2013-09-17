//
//  NSManagedObject+Mapping.h
//  MagicalData
//
//  Created by Mac on 13-9-13.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSObject (Mapping)
/**
 *	propertyNameMapping:
 *  format: @{@"propertyName":@"json'propertyName"}
 *	@return	the mapping dictionary
 */
-(NSDictionary *)propertyNameMapping;
/**
 *	propertyTypeFormat
 *  format: @{@"propertyName":@"dataType or object'class name"}
    if createDate is a NSDate type ,you can code @"createDate":@"yyyy-MM-dd HH:mm"
    if studentMembers is a NSArray type, you can code the NSArray'member type here , such as  @"studentMembers":@"StudentCD"  
    if teacher is a TeacherCD object value , you can code  @"teacher":@"TeacherCD"
 *	@return	the mapping dictionary
 */
-(NSDictionary *)propertyTypeFormat;
-(void)configMappingWithDictionary:(NSDictionary*)dic managerObjectContext:(NSManagedObjectContext*)context;

@end

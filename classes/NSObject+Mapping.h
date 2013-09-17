//
//  NSManagedObject+Mapping.h
//  MagicalData
//
//  Created by Mac on 13-9-13.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSObject (Mapping)

-(NSDictionary *)propertyNameMapping;
-(NSDictionary *)propertyTypeFormat;
-(void)configMappingWithDictionary:(NSDictionary*)dic managerObjectContext:(NSManagedObjectContext*)context;

@end

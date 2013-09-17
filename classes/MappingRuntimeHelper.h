//
//  NSManagedObject+Mapping.h
//  MagicalData
//
//  Created by Mac on 13-9-13.
//  Copyright (c) 2013年 nidom. All rights reserved.
//


@interface MappingRuntimeHelper : NSObject {
	
}
+ (BOOL)isPropertyReadOnly:(Class)klass propertyName:(NSString*)propertyName;
+ (Class)propertyClassForPropertyName:(NSString *)propertyName ofClass:(Class)klass;


@end

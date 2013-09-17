//
//  NSManagedObject+Mapping.m
//  MagicalData
//
//  Created by Mac on 13-9-13.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import "NSObject+Mapping.h"
#import "MappingRuntimeHelper.h"

@implementation NSObject (Mapping)

-(void)configMappingWithDictionary:(NSDictionary*)dic managerObjectContext:(NSManagedObjectContext*)context
{
    NSDictionary *nameMappingDic;
    NSDictionary *typeMappingDic;
    if([self respondsToSelector:NSSelectorFromString(@"propertyNameMapping")])
        nameMappingDic =[[self propertyNameMapping]retain];
    if([self respondsToSelector:NSSelectorFromString(@"propertyTypeFormat")])
        typeMappingDic   =[[self propertyTypeFormat]retain];
    
    for(NSString *key in [dic allKeys])
    {
        if([nameMappingDic objectForKey:key]){
            id value =[dic objectForKey:key];
            if (value == [NSNull null] || value == nil) {
                continue;
            }
            if(context!=nil){
                if ([MappingRuntimeHelper isPropertyReadOnly:[self class] propertyName:[nameMappingDic valueForKey:key]]) {
                    continue;
                }
                
            }
            // deal with Dictionary
            if ([value isKindOfClass:[NSDictionary class]]) {
                NSDictionary *tempDic =[value retain];
                Class klass =NSClassFromString([typeMappingDic valueForKey:[nameMappingDic valueForKey:key] ]);
                if(context)
                { value =  [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(klass) inManagedObjectContext: context];
                    [value configMappingWithDictionary:tempDic managerObjectContext:context];
                    [tempDic release];
                }
                else {value =[[klass alloc]init];
                    [value configMappingWithDictionary:tempDic managerObjectContext:nil];
                    [tempDic release];}
            }
            else if ([value isKindOfClass:[NSArray class]]) {
                Class arrayItemType =NSClassFromString([typeMappingDic objectForKey:[nameMappingDic valueForKey:key]]);
                
                NSMutableArray *childObjects = [NSMutableArray arrayWithCapacity:[(NSArray*)value count]];
                
                for (id child in value) {
                    if ([[child class] isSubclassOfClass:[NSDictionary class]]) {
                        NSObject *childDTO ;
                        if(context){
                            childDTO =  [NSEntityDescription insertNewObjectForEntityForName:  NSStringFromClass(arrayItemType) inManagedObjectContext: context];
                            [childDTO configMappingWithDictionary:child managerObjectContext:context];
                        }
                        
                        else {childDTO = [[arrayItemType alloc] init];
                            [childDTO configMappingWithDictionary:child managerObjectContext:nil];}
                        [childObjects addObject:childDTO];
                    } else {
                        [childObjects addObject:child];
                    }
                }
                
                value = childObjects;
            }
            
            else value = [self dealWithObjectWithKey:key value:value nameMappingDic:nameMappingDic  typeMappingDic:typeMappingDic];
            [self setValue:value forKey:[nameMappingDic valueForKey:key]];
            
            
        }
    }
    [nameMappingDic release];
    [typeMappingDic release];
    
}

-(id)dealWithObjectWithKey:(id)key value:(id)value nameMappingDic:(NSDictionary*)nameMappingDic typeMappingDic:(NSDictionary *)typeMappingDic
{
    id retunValue=nil;
    Class  propertyClass =[MappingRuntimeHelper propertyClassForPropertyName:[nameMappingDic valueForKey:key] ofClass:[self class]];
    if (propertyClass==[NSDate class])
    {   NSDateFormatter *formatter =[[NSDateFormatter alloc]init];
        [formatter setDateFormat:[typeMappingDic valueForKey:[nameMappingDic valueForKey:key]]];
        retunValue =[formatter dateFromString:value];
    }
    else
        retunValue = value;
    return retunValue;
}

-(NSDictionary *)propertyNameMapping
{
    return nil;
}
-(NSDictionary *)propertyTypeFormat
{
    return nil;
}
@end

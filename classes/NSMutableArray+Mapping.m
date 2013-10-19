//
//  NSMutableArray+Mapping.m
//  margicalMapping
//
//  Created by lixiang on 13-10-19.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import "NSMutableArray+Mapping.h"
#import "NSObject+Mapping.h"

@implementation NSMutableArray (Mapping)

- (void)configMappingWithDictionary:(NSArray *)array forClass:(Class)kclass {
    for (NSDictionary *dic in array) {
        NSObject *obj = [[kclass alloc] init];
        [obj configMappingWithDictionary:dic managerObjectContext:nil];
        [self addObject:obj];
    }
}

@end

//
//  StudentCD.h
//  margicalMapping
//
//  Created by Mac on 13-9-17.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StudentCD : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;

@end

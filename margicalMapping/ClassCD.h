//
//  ClassCD.h
//  margicalMapping
//
//  Created by Mac on 13-9-17.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ClassCD : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * studentsCount;
@property (nonatomic, retain) NSNumber * isGoodClass;
@property (nonatomic, retain) NSString * leaderName;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) id studentMembers;
@property (nonatomic, retain) id teacher;

@end

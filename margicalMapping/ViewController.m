//
//  ViewController.m
//  margicalMapping
//
//  Created by Mac on 13-9-16.
//  Copyright (c) 2013年 nidom. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"
#import "ClassObj.h"
#import "NSObject+Mapping.h"
#import "ClassCD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL * url =[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"data" ofType:@"json"]];
    NSData *jsonData =[NSData dataWithContentsOfURL:url];
    NSDictionary *jsonDic =[jsonData objectFromJSONData];
    
    ClassObj *classObj =[[ClassObj alloc]init];
    [classObj configMappingWithDictionary:jsonDic managerObjectContext:nil];
    NSLog(@"\n****commonModel\n\nclassName:%@\nstudentsCount:%d\nisGoodClass:%d\nleaderName:%@\ncreateDate:%@\nstudents:%@\nenlishTeacher:%@\n\n\n",classObj.className,[classObj.studentsCount intValue],[classObj.isGoodClass intValue],classObj.leaderName,classObj.createDate,classObj.studentMembers,classObj.teacher);
   
    
//
 NSManagedObjectModel *  objectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
NSPersistentStoreCoordinator *  coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:objectModel];
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *filePath = [documentsDir stringByAppendingPathComponent:@"datastore.sqlite"];
    NSURL *databaseURL = [NSURL fileURLWithPath:filePath];
    NSError *error = nil;
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:databaseURL options:nil error:&error];
NSManagedObjectContext *  objectContext = [[NSManagedObjectContext alloc] init];
    [objectContext setPersistentStoreCoordinator:coordinator];
    
    ClassCD *classCD =[NSEntityDescription insertNewObjectForEntityForName:@"ClassCD" inManagedObjectContext:objectContext];
    [classCD configMappingWithDictionary:jsonDic managerObjectContext:objectContext];
   	    NSLog(@"\n****coredataModel\n\n\nclassName:%@\nstudentsCount:%d\nisGoodClass:%d\nleaderName:%@\ncreateDate:%@\nstudents:%@\nenlishTeacher:%@",classCD.name,[classCD.studentsCount intValue],[classCD.isGoodClass intValue],classCD.leaderName,classCD.createDate,classCD.studentMembers,classCD.teacher);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

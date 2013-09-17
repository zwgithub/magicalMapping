magicalMapping
==============
ios model mapping lib ， NSDate and CoreData supported

code style

#import "TeacherObj.h"
@interface ClassObj : NSObject
@property(nonatomic,copy)NSString *className;
@property(nonatomic,retain)NSNumber *studentsCount;
@property(nonatomic,assign)NSNumber *isGoodClass;
@property(nonatomic,copy)NSString *leaderName;
@property(nonatomic,retain)NSDate *createDate;
@property(nonatomic,retain)NSArray *studentMembers;
@property(nonatomic,retain)TeacherObj *teacher;
@end

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

//
//  CoursesModel.m
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "CoursesModel.h"
#import "Course.h"

@implementation CoursesModel

- (void)saveCourseData{
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.coursesList];
   
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"CoursesList"];
    Course *course = self.coursesList[0];
    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:course.teacher, nil];
    
    for(Course *course in self.coursesList){
        BOOL flag = false;
        for(NSInteger i = 0; i<array.count;i++){
            if([course.teacher isEqualToString:array[i]]){
                flag = TRUE;
                break;
            }
        }
        if(flag == false){
            [array addObject:course.teacher];
        }
    }
    
    NSArray *noRepeatCoursesList = array;
    
    NSData *noRepeatData = [NSKeyedArchiver archivedDataWithRootObject:noRepeatCoursesList];
    
    [[NSUserDefaults standardUserDefaults]setObject:noRepeatData forKey:@"NoRepeatTeachersList"];
}


#pragma mark - Init Data Model

- (void)initCoursesModel{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"CoursesList"];
    
    if (data == nil) {
        
        self.coursesList = [[NSMutableArray alloc]init];
        
        //同济大学课程
        Course *course1 = [[Course alloc]init];
        course1.name = @"软件测试技术";
        course1.teacher = @"刘琴";
        course1.weekDate = [NSNumber numberWithInt:3];
        course1.dayTime = [NSNumber numberWithInt:2];
        course1.room = @"济事楼430";
        course1.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course2 = [[Course alloc]init];
        course2.name = @"软件测试技术";
        course2.teacher = @"刘琴";
        course2.weekDate = [NSNumber numberWithInt:5];
        course2.dayTime = [NSNumber numberWithInt:2];
        course2.room = @"济事楼434";
        course2.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course3 = [[Course alloc]init];
        course3.name = @"软件复用";
        course3.teacher = @"史扬";
        course3.weekDate = [NSNumber numberWithInt:5];
        course3.dayTime = [NSNumber numberWithInt:4];
        course3.room = @"济事楼516";
        course3.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course4 = [[Course alloc]init];
        course4.name = @"软件复用";
        course4.teacher = @"史扬";
        course4.weekDate = [NSNumber numberWithInt:6];
        course4.dayTime = [NSNumber numberWithInt:1];
        course4.room = @"济事楼516";
        course4.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course5 = [[Course alloc]init];
        course5.name = @".net体系结构与设计开发";
        course5.teacher = @"史扬";
        course5.weekDate = [NSNumber numberWithInt:5];
        course5.dayTime = [NSNumber numberWithInt:3];
        course5.room = @"济事楼516";
        course5.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course6 = [[Course alloc]init];
        course6.name = @".net体系结构与设计开发";
        course6.teacher = @"史扬";
        course6.weekDate = [NSNumber numberWithInt:3];
        course6.dayTime = [NSNumber numberWithInt:4];
        course6.room = @"济事楼516";
        course6.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course7 = [[Course alloc]init];
        course7.name = @"离散数学";
        course7.teacher = @"史扬";
        course7.weekDate = [NSNumber numberWithInt:2];
        course7.dayTime = [NSNumber numberWithInt:4];
        course7.room = @"北420";
        course7.address = @"上海市杨浦区同济大学北楼";
        
        Course *course8 = [[Course alloc]init];
        course8.name = @"离散数学";
        course8.teacher = @"史扬";
        course8.weekDate = [NSNumber numberWithInt:5];
        course8.dayTime = [NSNumber numberWithInt:1];
        course8.room = @"北420";
        course8.address = @"上海市杨浦区同济大学北楼";
        
        Course *course9 = [[Course alloc]init];
        course9.name = @"数据库原理与应用";
        course9.teacher = @"穆斌";
        course9.weekDate = [NSNumber numberWithInt:5];
        course9.dayTime = [NSNumber numberWithInt:1];
        course9.room = @"B406";
        course9.address = @"上海市嘉定区同济大学博楼";
        
        Course *course10 = [[Course alloc]init];
        course10.name = @"数据库原理与应用";
        course10.teacher = @"穆斌";
        course10.weekDate = [NSNumber numberWithInt:3];
        course10.dayTime = [NSNumber numberWithInt:2];
        course10.room = @"B406";
        course10.address = @"上海市嘉定区同济大学博楼";
        
        Course *course11 = [[Course alloc]init];
        course11.name = @"数据库原理与应用";
        course11.teacher = @"穆斌";
        course11.weekDate = [NSNumber numberWithInt:3];
        course11.dayTime = [NSNumber numberWithInt:1];
        course11.room = @"B406";
        course11.address = @"上海市嘉定区同济大学博楼";
        
        Course *course12 = [[Course alloc]init];
        course12.name = @"数据库原理与应用";
        course12.teacher = @"穆斌";
        course12.weekDate = [NSNumber numberWithInt:5];
        course12.dayTime = [NSNumber numberWithInt:2];
        course12.room = @"B406";
        course12.address = @"上海市嘉定区同济大学博楼";
        
        Course *course13 = [[Course alloc]init];
        course13.name = @"软件架构与设计模式";
        course13.teacher = @"尹长青";
        course13.weekDate = [NSNumber numberWithInt:2];
        course13.dayTime = [NSNumber numberWithInt:5];
        course13.room = @"济事楼434";
        course13.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course14 = [[Course alloc]init];
        course14.name = @"软件架构与设计模式";
        course14.teacher = @"尹长青";
        course14.weekDate = [NSNumber numberWithInt:4];
        course14.dayTime = [NSNumber numberWithInt:5];
        course14.room = @"济事楼434";
        course14.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course15 = [[Course alloc]init];
        course15.name = @"信息安全基础";
        course15.teacher = @"尹长青";
        course15.weekDate = [NSNumber numberWithInt:4];
        course15.dayTime = [NSNumber numberWithInt:4];
        course15.room = @"济事楼516";
        course15.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course16 = [[Course alloc]init];
        course16.name = @"信息安全基础";
        course16.teacher = @"尹长青";
        course16.weekDate = [NSNumber numberWithInt:2];
        course16.dayTime = [NSNumber numberWithInt:4];
        course16.room = @"济事楼516";
        course16.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course17 = [[Course alloc]init];
        course17.name = @"GIS导论";
        course17.teacher = @"曹布阳";
        course17.weekDate = [NSNumber numberWithInt:6];
        course17.dayTime = [NSNumber numberWithInt:3];
        course17.room = @"济事楼430";
        course17.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course18 = [[Course alloc]init];
        course18.name = @"软件项目管理";
        course18.teacher = @"曹布阳";
        course18.weekDate = [NSNumber numberWithInt:4];
        course18.dayTime = [NSNumber numberWithInt:2];
        course18.room = @"济事楼430";
        course18.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course19 = [[Course alloc]init];
        course19.name = @"软件项目管理";
        course19.teacher = @"曹布阳";
        course19.weekDate = [NSNumber numberWithInt:6];
        course19.dayTime = [NSNumber numberWithInt:2];
        course19.room = @"济事楼430";
        course19.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course20 = [[Course alloc]init];
        course20.name = @"GIS导论";
        course20.teacher = @"曹布阳";
        course20.weekDate = [NSNumber numberWithInt:4];
        course20.dayTime = [NSNumber numberWithInt:3];
        course20.room = @"济事楼430";
        course20.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course21 = [[Course alloc]init];
        course21.name = @"软件项目管理";
        course21.teacher = @"杜庆峰";
        course21.weekDate = [NSNumber numberWithInt:3];
        course21.dayTime = [NSNumber numberWithInt:1];
        course21.room = @"济事楼430";
        course1.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course22 = [[Course alloc]init];
        course22.name = @"软件项目管理";
        course22.teacher = @"杜庆峰";
        course22.weekDate = [NSNumber numberWithInt:5];
        course22.dayTime = [NSNumber numberWithInt:1];
        course22.room = @"济事楼430";
        course22.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course23 = [[Course alloc]init];
        course23.name = @"软件测试技术";
        course23.teacher = @"杜庆峰";
        course23.weekDate = [NSNumber numberWithInt:3];
        course23.dayTime = [NSNumber numberWithInt:2];
        course23.room = @"济事楼430";
        course23.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course24 = [[Course alloc]init];
        course24.name = @"软件测试技术";
        course24.teacher = @"杜庆峰";
        course24.weekDate = [NSNumber numberWithInt:5];
        course24.dayTime = [NSNumber numberWithInt:2];
        course24.room = @"济事楼430";
        course24.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course25 = [[Course alloc]init];
        course25.name = @"数据库原理与应用";
        course25.teacher = @"袁时金";
        course25.weekDate = [NSNumber numberWithInt:4];
        course25.dayTime = [NSNumber numberWithInt:2];
        course25.room = @"A106";
        course25.address = @"上海市嘉定区同济大学安楼";
        
        Course *course26 = [[Course alloc]init];
        course26.name = @"数据库原理与应用";
        course26.teacher = @"袁时金";
        course26.weekDate = [NSNumber numberWithInt:6];
        course26.dayTime = [NSNumber numberWithInt:2];
        course26.room = @"A106";
        course26.address = @"上海市嘉定区同济大学安楼";
        
        Course *course27 = [[Course alloc]init];
        course27.name = @"面向对象程序设计";
        course27.teacher = @"赵钦佩";
        course27.weekDate = [NSNumber numberWithInt:3];
        course27.dayTime = [NSNumber numberWithInt:1];
        course27.room = @"北206";
        course27.address = @"上海市杨浦区同济大学北楼";
        
        Course *course28 = [[Course alloc]init];
        course28.name = @"面向对象程序设计";
        course28.teacher = @"赵钦佩";
        course28.weekDate = [NSNumber numberWithInt:5];
        course28.dayTime = [NSNumber numberWithInt:1];
        course28.room = @"北206";
        course28.address = @"上海市杨浦区同济大学北楼";
        
        Course *course29 = [[Course alloc]init];
        course29.name = @"软件过程与管理";
        course29.teacher = @"赵钦佩";
        course29.weekDate = [NSNumber numberWithInt:2];
        course29.dayTime = [NSNumber numberWithInt:1];
        course29.room = @"北206";
        course29.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course30 = [[Course alloc]init];
        course30.name = @"java EE";
        course30.teacher = @"金伟祖";
        course30.weekDate = [NSNumber numberWithInt:3];
        course30.dayTime = [NSNumber numberWithInt:1];
        course30.room = @"济事楼430";
        course30.address = @"上海市嘉定区同济大学济事楼";
        
        //上海财经大学课程
        Course *course31 = [[Course alloc]init];
        course31.name = @"中级微观经济学";
        course31.teacher = @"周德武";
        course31.weekDate = [NSNumber numberWithInt:4];
        course31.dayTime = [NSNumber numberWithInt:2];
        course31.room = @"二教415";
        course31.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course32 = [[Course alloc]init];
        course32.name = @"中级微观经济学";
        course32.teacher = @"周德武";
        course32.weekDate = [NSNumber numberWithInt:6];
        course32.dayTime = [NSNumber numberWithInt:1];
        course32.room = @"二教415";
        course32.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course33 = [[Course alloc]init];
        course33.name = @"经济法概论";
        course33.teacher = @"吴文芳";
        course33.weekDate = [NSNumber numberWithInt:5];
        course33.dayTime = [NSNumber numberWithInt:5];
        course33.room = @"武东路梯五";
        course33.address = @"上海财经大学(武东路校区)武东路梯教";
        
        Course *course34 = [[Course alloc]init];
        course34.name = @"经济法概论";
        course34.teacher = @"陈芳";
        course34.weekDate = [NSNumber numberWithInt:6];
        course34.dayTime = [NSNumber numberWithInt:2];
        course34.room = @"一教205";
        course34.address = @"上海市杨浦区上海财经大学第一教学楼";
        
        Course *course35 = [[Course alloc]init];
        course35.name = @"中级宏观经济学";
        course35.teacher = @"叶正茂";
        course35.weekDate = [NSNumber numberWithInt:4];
        course35.dayTime = [NSNumber numberWithInt:5];
        course35.room = @"二教205";
        course35.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course36 = [[Course alloc]init];
        course36.name = @"经济学思想与方法";
        course36.teacher = @"叶海春";
        course36.weekDate = [NSNumber numberWithInt:6];
        course36.dayTime = [NSNumber numberWithInt:5];
        course36.room = @"国定路梯三";
        course36.address = @"上海财经大学(武川路校区)经济学院梯教";
        
        Course *course37 = [[Course alloc]init];
        course37.name = @"货币银行学";
        course37.teacher = @"胡乃红";
        course37.weekDate = [NSNumber numberWithInt:4];
        course37.dayTime = [NSNumber numberWithInt:4];
        course37.room = @"三教303";
        course37.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course38 = [[Course alloc]init];
        course38.name = @"货币银行学";
        course38.teacher = @"胡乃红";
        course38.weekDate = [NSNumber numberWithInt:4];
        course38.dayTime = [NSNumber numberWithInt:2];
        course38.room = @"三教201";
        course38.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course39 = [[Course alloc]init];
        course39.name = @"货币银行学";
        course39.teacher = @"吴以雯";
        course39.weekDate = [NSNumber numberWithInt:4];
        course39.dayTime = [NSNumber numberWithInt:2];
        course39.room = @"三教301";
        course39.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course40 = [[Course alloc]init];
        course40.name = @"货币银行学";
        course40.teacher = @"吴以雯";
        course40.weekDate = [NSNumber numberWithInt:4];
        course40.dayTime = [NSNumber numberWithInt:4];
        course40.room = @"三教301";
        course40.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course41 = [[Course alloc]init];
        course41.name = @"先秦诸子文学";
        course41.teacher = @"陈成吒";
        course41.weekDate = [NSNumber numberWithInt:6];
        course41.dayTime = [NSNumber numberWithInt:4];
        course41.room = @"武东路梯六";
        course41.address = @"上海财经大学(武东路校区)武东路梯教";
        
        Course *course42 = [[Course alloc]init];
        course42.name = @"黑格尔哲学";
        course42.teacher = @"章忠民";
        course42.weekDate = [NSNumber numberWithInt:5];
        course42.dayTime = [NSNumber numberWithInt:4];
        course42.room = @"国定路梯四";
        course42.address = @"上海财经大学(武川路校区)经济学院梯教";
        
        Course *course43 = [[Course alloc]init];
        course43.name = @"公司金融";
        course43.teacher = @"李曜";
        course43.weekDate = [NSNumber numberWithInt:1];
        course43.dayTime = [NSNumber numberWithInt:1];
        course43.room = @"博思楼403";
        course43.address = @"上海财经大学博思楼";
        
        Course *course44 = [[Course alloc]init];
        course44.name = @"财务会计";
        course44.teacher = @"阴慧芳";
        course44.weekDate = [NSNumber numberWithInt:2];
        course44.dayTime = [NSNumber numberWithInt:4];
        course44.room = @"三教204";
        course44.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course45 = [[Course alloc]init];
        course45.name = @"财务会计";
        course45.teacher = @"阴慧芳";
        course45.weekDate = [NSNumber numberWithInt:4];
        course45.dayTime = [NSNumber numberWithInt:4];
        course45.room = @"三教204";
        course45.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course46 = [[Course alloc]init];
        course46.name = @"财务会计";
        course46.teacher = @"三子田";
        course46.weekDate = [NSNumber numberWithInt:2];
        course46.dayTime = [NSNumber numberWithInt:4];
        course46.room = @"二教207";
        course46.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course47 = [[Course alloc]init];
        course47.name = @"财务会计";
        course47.teacher = @"三子田";
        course47.weekDate = [NSNumber numberWithInt:4];
        course47.dayTime = [NSNumber numberWithInt:4];
        course47.room = @"二教207";
        course47.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course48 = [[Course alloc]init];
        course48.name = @"市场营销学";
        course48.teacher = @"叶巍岭";
        course48.weekDate = [NSNumber numberWithInt:6];
        course48.dayTime = [NSNumber numberWithInt:3];
        course48.room = @"三教209";
        course48.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course49 = [[Course alloc]init];
        course49.name = @"市场营销学";
        course49.teacher = @"楼尊";
        course49.weekDate = [NSNumber numberWithInt:5];
        course49.dayTime = [NSNumber numberWithInt:4];
        course49.room = @"三教503";
        course49.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course50 = [[Course alloc]init];
        course50.name = @"市场营销学";
        course50.teacher = @"黄蓉";
        course50.weekDate = [NSNumber numberWithInt:2];
        course50.dayTime = [NSNumber numberWithInt:5];
        course50.room = @"三教109";
        course50.address = @"上海市杨浦区上海财经大学第三教学楼";
//        
//        Course *course51 = [[Course alloc]init];
//        course51.name = @"管理会计";
//        course51.teacher = @"陈振婷";
//        course51.weekDate = [NSNumber numberWithInt:5];
//        course51.dayTime = [NSNumber numberWithInt:3];
//        course51.room = @"二教207";
//        course1.address = @"上海市杨浦区上海财经大学第二教学楼";
//        
//        Course *course52 = [[Course alloc]init];
//        course52.name = @"国际贸易";
//        course52.teacher = @"余智";
//        course52.weekDate = [NSNumber numberWithInt:4];
//        course52.dayTime = [NSNumber numberWithInt:1];
//        course52.room = @"三教310";
//        course1.address = @"上海市杨浦区上海财经大学第三教学楼";
//        
//        Course *course53 = [[Course alloc]init];
//        course53.name = @"国际贸易";
//        course53.teacher = @"余智";
//        course53.weekDate = [NSNumber numberWithInt:4];
//        course53.dayTime = [NSNumber numberWithInt:2];
//        course53.room = @"三教310";
//        course1.address = @"上海市杨浦区上海财经大学第三教学楼";
//        
//        Course *course54 = [[Course alloc]init];
//        course54.name = @"国际金融";
//        course54.teacher = @"谈儒勇";
//        course54.weekDate = [NSNumber numberWithInt:6];
//        course54.dayTime = [NSNumber numberWithInt:2];
//        course54.room = @"三教209";
//        course1.address = @"上海市杨浦区上海财经大学第三教学楼";
//        
//        Course *course55 = [[Course alloc]init];
//        course55.name = @"战略管理";
//        course55.teacher = @"王琴";
//        course55.weekDate = [NSNumber numberWithInt:3];
//        course55.dayTime = [NSNumber numberWithInt:2];
//        course55.room = @"一教109";
//        course1.address = @"上海市杨浦区上海财经大学第一教学楼";
//        
//        Course *course56 = [[Course alloc]init];
//        course56.name = @"战略管理";
//        course56.teacher = @"王琴";
//        course56.weekDate = [NSNumber numberWithInt:3];
//        course56.dayTime = [NSNumber numberWithInt:2];
//        course56.room = @"一教403";
//        course1.address = @"上海市杨浦区上海财经大学第一教学楼";
//        
//        Course *course57 = [[Course alloc]init];
//        course57.name = @"战略管理";
//        course57.teacher = @"吴树斌";
//        course57.weekDate = [NSNumber numberWithInt:4];
//        course57.dayTime = [NSNumber numberWithInt:3];
//        course57.room = @"四教112";
//        course1.address = @"上海市杨浦区上海财经大学第四教学楼";
//        
//        Course *course58 = [[Course alloc]init];
//        course58.name = @"战略管理";
//        course58.teacher = @"吴树斌";
//        course58.weekDate = [NSNumber numberWithInt:4];
//        course58.dayTime = [NSNumber numberWithInt:3];
//        course58.room = @"一教212";
//        course1.address = @"上海市杨浦区上海财经大学第一教学楼";
//        
//        Course *course59 = [[Course alloc]init];
//        course59.name = @"统计学";
//        course59.teacher = @"凌洁";
//        course59.weekDate = [NSNumber numberWithInt:4];
//        course59.dayTime = [NSNumber numberWithInt:4];
//        course59.room = @"三教203";
//        course1.address = @"上海市杨浦区上海财经大学第三教学楼";
//        
//        Course *course60 = [[Course alloc]init];
//        course60.name = @"房地产与经济";
//        course60.teacher = @"姚玲珍";
//        course60.weekDate = [NSNumber numberWithInt:4];
//        course60.dayTime = [NSNumber numberWithInt:4];
//        course60.room = @"二教306";
//        course1.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        //复旦大学课程
        Course *course61 = [[Course alloc]init];
        course61.name = @"新闻学概论";
        course61.teacher = @"周海晏";
        course61.weekDate = [NSNumber numberWithInt:6];
        course61.dayTime = [NSNumber numberWithInt:2];
        course61.room = @" HQ201";
        course61.address = @"复旦大学新闻学院教学楼";
        
        Course *course62 = [[Course alloc]init];
        course62.name = @"微观经济学A";
        course62.teacher = @"程向前";
        course62.weekDate = [NSNumber numberWithInt:5];
        course62.dayTime = [NSNumber numberWithInt:2];
        course62.room = @"H6207";
        course62.address = @"复旦大学第六教学楼";
        
        Course *course63 = [[Course alloc]init];
        course63.name = @"现代西方心理学名著导读";
        course63.teacher = @"陈晓云";
        course63.weekDate = [NSNumber numberWithInt:4];
        course63.dayTime = [NSNumber numberWithInt:2];
        course63.room = @"H6201";
        course63.address = @"复旦大学第六教学楼";
        
        Course *course64 = [[Course alloc]init];
        course64.name = @"文学原典导读";
        course64.teacher = @"金理";
        course64.weekDate = [NSNumber numberWithInt:4];
        course64.dayTime = [NSNumber numberWithInt:2];
        course64.room = @"HGX508";
        course64.address = @"复旦大学光华楼西辅楼";
        
        Course *course65 = [[Course alloc]init];
        course65.name = @"中国文学传统";
        course65.teacher = @"汪涌豪";
        course65.weekDate = [NSNumber numberWithInt:2];
        course65.dayTime = [NSNumber numberWithInt:2];
        course65.room = @"HGX104";
        course65.address = @"复旦大学光华楼西辅楼";
        
        Course *course66 = [[Course alloc]init];
        course66.name = @"中国传统戏剧赏析";
        course66.teacher = @"盛青";
        course66.weekDate = [NSNumber numberWithInt:5];
        course66.dayTime = [NSNumber numberWithInt:4];
        course66.room = @"HGD510";
        course66.address = @"复旦大学光华楼东辅楼";
        
        Course *course67 = [[Course alloc]init];
        course67.name = @"组织传播学";
        course67.teacher = @"谢静";
        course67.weekDate = [NSNumber numberWithInt:5];
        course67.dayTime = [NSNumber numberWithInt:2];
        course67.room = @"HQ303";
        course67.address = @"复旦大学新闻学院教学楼";
        
        Course *course68 = [[Course alloc]init];
        course68.name = @"媒介与社会性别";
        course68.teacher = @"曹晋";
        course68.weekDate = [NSNumber numberWithInt:2];
        course68.dayTime = [NSNumber numberWithInt:2];
        course68.room = @"HQ201";
        course68.address = @"复旦大学新闻学院教学楼";
        
        Course *course69 = [[Course alloc]init];
        course69.name = @"政府公共关系";
        course69.teacher = @"朱春阳";
        course69.weekDate = [NSNumber numberWithInt:4];
        course69.dayTime = [NSNumber numberWithInt:4];
        course69.room = @"HQ201";
        course69.address = @"复旦大学新闻学院教学楼";
        
        Course *course70 = [[Course alloc]init];
        course70.name = @"社会学导论";
        course70.teacher = @"徐建牛";
        course70.weekDate = [NSNumber numberWithInt:2];
        course70.dayTime = [NSNumber numberWithInt:5];
        course70.room = @"H6112";
        course70.address = @"复旦大学第六教学楼";
        
        Course *course71 = [[Course alloc]init];
        course71.name = @"社会学导论";
        course71.teacher = @"王威海";
        course71.weekDate = [NSNumber numberWithInt:3];
        course71.dayTime = [NSNumber numberWithInt:2];
        course71.room = @"H6412";
        course71.address = @"复旦大学第六教学楼";
        
        Course *course72 = [[Course alloc]init];
        course72.name = @"法学基础理论";
        course72.teacher = @"姚军";
        course72.weekDate = [NSNumber numberWithInt:2];
        course72.dayTime = [NSNumber numberWithInt:2];
        course72.room = @"H6112";
        course72.address = @"复旦大学第六教学楼";
        
        Course *course73 = [[Course alloc]init];
        course73.name = @"法学基础理论";
        course73.teacher = @"杨晓畅";
        course73.weekDate = [NSNumber numberWithInt:5];
        course73.dayTime = [NSNumber numberWithInt:2];
        course73.room = @"H3308";
        course73.address = @"复旦大学第三教学楼";
        
        Course *course74 = [[Course alloc]init];
        course74.name = @"法学基础理论";
        course74.teacher = @"侯健";
        course74.weekDate = [NSNumber numberWithInt:4];
        course74.dayTime = [NSNumber numberWithInt:4];
        course74.room = @"H4101";
        course74.address = @"复旦大学第四教学楼";
        
        Course *course75 = [[Course alloc]init];
        course75.name = @"心理学导论";
        course75.teacher = @"李晓茹";
        course75.weekDate = [NSNumber numberWithInt:6];
        course75.dayTime = [NSNumber numberWithInt:4];
        course75.room = @"H6312";
        course75.address = @"复旦大学第六教学楼";
        
        Course *course76 = [[Course alloc]init];
        course76.name = @"心理学导论";
        course76.teacher = @"高隽";
        course76.weekDate = [NSNumber numberWithInt:6];
        course76.dayTime = [NSNumber numberWithInt:5];
        course76.room = @"H6101";
        course76.address = @"复旦大学第六教学楼";
        
        Course *course77 = [[Course alloc]init];
        course77.name = @"应用伦理学";
        course77.teacher = @"陈金华";
        course77.weekDate = [NSNumber numberWithInt:5];
        course77.dayTime = [NSNumber numberWithInt:4];
        course77.room = @"H3306";
        course77.address = @"复旦大学第三教学楼";
        
        Course *course78 = [[Course alloc]init];
        course78.name = @"世界文学导读";
        course78.teacher = @"汪洪章";
        course78.weekDate = [NSNumber numberWithInt:4];
        course78.dayTime = [NSNumber numberWithInt:4];
        course78.room = @"H6112";
        course78.address = @"复旦大学第六教学楼";
        
        Course *course79 = [[Course alloc]init];
        course79.name = @"哲学原典导读";
        course79.teacher = @"程群";
        course79.weekDate = [NSNumber numberWithInt:4];
        course79.dayTime = [NSNumber numberWithInt:3];
        course79.room = @"HGX507";
        course79.address = @"复旦大学光华楼西辅楼";
        
        Course *course80 = [[Course alloc]init];
        course80.name = @"当代世界经济与政治";
        course80.teacher = @"钱箭星";
        course80.weekDate = [NSNumber numberWithInt:6];
        course80.dayTime = [NSNumber numberWithInt:4];
        course80.room = @"H3206";
        course80.address = @"复旦大学第三教学楼";
        
//        Course *course81 = [[Course alloc]init];
//        course81.name = @"身边的基因科学";
//        course81.teacher = @"皮妍";
//        course81.weekDate = [NSNumber numberWithInt:3];
//        course81.dayTime = [NSNumber numberWithInt:5];
//        course81.room = @"HGX210";
//        course61.address = @"复旦大学光华楼西辅楼";
//        
//        Course *course82 = [[Course alloc]init];
//        course82.name = @"现代金融与法律";
//        course82.teacher = @"白江";
//        course82.weekDate = [NSNumber numberWithInt:5];
//        course82.dayTime = [NSNumber numberWithInt:5];
//        course82.room = @"H4204";
//        course61.address = @"复旦大学第四教学楼";
//        
//        Course *course83 = [[Course alloc]init];
//        course83.name = @"基督教哲学";
//        course83.teacher = @"张庆熊";
//        course83.weekDate = [NSNumber numberWithInt:4];
//        course83.dayTime = [NSNumber numberWithInt:4];
//        course83.room = @"HGX103";
//        course61.address = @"复旦大学光华楼西辅楼";
//        
//        Course *course84 = [[Course alloc]init];
//        course84.name = @"投资学原理";
//        course84.teacher = @"蒋祥林";
//        course84.weekDate = [NSNumber numberWithInt:5];
//        course84.dayTime = [NSNumber numberWithInt:1];
//        course84.room = @"H5116";
//        course61.address = @"复旦大学第五教学楼";
//        
//        Course *course85 = [[Course alloc]init];
//        course85.name = @"投资学原理";
//        course85.teacher = @"谭之博";
//        course85.weekDate = [NSNumber numberWithInt:4];
//        course85.dayTime = [NSNumber numberWithInt:4];
//        course85.room = @"H5319";
//        course61.address = @"复旦大学第五教学楼";
//        
//        Course *course86 = [[Course alloc]init];
//        course86.name = @"公司金融学";
//        course86.teacher = @"沈红波";
//        course86.weekDate = [NSNumber numberWithInt:5];
//        course86.dayTime = [NSNumber numberWithInt:4];
//        course86.room = @"H6108";
//        course61.address = @"复旦大学第六教学楼";
//        
//        Course *course87 = [[Course alloc]init];
//        course87.name = @"公司金融学";
//        course87.teacher = @"朱叶";
//        course87.weekDate = [NSNumber numberWithInt:5];
//        course87.dayTime = [NSNumber numberWithInt:4];
//        course87.room = @"H5116";
//        course61.address = @"复旦大学第五教学楼";
//        
//        Course *course88 = [[Course alloc]init];
//        course88.name = @"风险投资导论";
//        course88.teacher = @"张陆洋";
//        course88.weekDate = [NSNumber numberWithInt:2];
//        course88.dayTime = [NSNumber numberWithInt:1];
//        course88.room = @"H6204";
//        course61.address = @"复旦大学第六教学楼";
//        
//        Course *course89 = [[Course alloc]init];
//        course89.name = @"考古学导论";
//        course89.teacher = @"潘碧华";
//        course89.weekDate = [NSNumber numberWithInt:2];
//        course89.dayTime = [NSNumber numberWithInt:4];
//        course89.room = @"H4301";
//        course61.address = @"复旦大学第四教学楼";
//        
//        Course *course90 = [[Course alloc]init];
//        course90.name = @"民俗学概论";
//        course90.teacher = @"吕静";
//        course90.weekDate = [NSNumber numberWithInt:2];
//        course90.dayTime = [NSNumber numberWithInt:2];
//        course90.room = @"HGX207";
//        course61.address = @"复旦大学光华楼西辅楼";

        
        [self.coursesList addObject:course1];
        [self.coursesList addObject:course2];
        [self.coursesList addObject:course3];
        [self.coursesList addObject:course4];
        [self.coursesList addObject:course5];
        [self.coursesList addObject:course6];
        [self.coursesList addObject:course7];
        [self.coursesList addObject:course8];
        [self.coursesList addObject:course9];
        [self.coursesList addObject:course10];
        [self.coursesList addObject:course11];
        [self.coursesList addObject:course12];
        [self.coursesList addObject:course13];
        [self.coursesList addObject:course14];
        [self.coursesList addObject:course15];
        [self.coursesList addObject:course16];
        [self.coursesList addObject:course17];
        [self.coursesList addObject:course18];
        [self.coursesList addObject:course19];
        [self.coursesList addObject:course20];
        [self.coursesList addObject:course21];
        [self.coursesList addObject:course22];
        [self.coursesList addObject:course23];
        [self.coursesList addObject:course24];
        [self.coursesList addObject:course25];
        [self.coursesList addObject:course26];
        [self.coursesList addObject:course27];
        [self.coursesList addObject:course28];
        [self.coursesList addObject:course29];
        [self.coursesList addObject:course30];
        [self.coursesList addObject:course31];
        [self.coursesList addObject:course32];
        [self.coursesList addObject:course33];
        [self.coursesList addObject:course34];
        [self.coursesList addObject:course35];
        [self.coursesList addObject:course36];
        [self.coursesList addObject:course37];
        [self.coursesList addObject:course38];
        [self.coursesList addObject:course39];
        [self.coursesList addObject:course40];
        [self.coursesList addObject:course41];
        [self.coursesList addObject:course42];
        [self.coursesList addObject:course43];
        [self.coursesList addObject:course44];
        [self.coursesList addObject:course45];
        [self.coursesList addObject:course46];
        [self.coursesList addObject:course47];
        [self.coursesList addObject:course48];
        [self.coursesList addObject:course49];
        [self.coursesList addObject:course50];
//        [self.coursesList addObject:course51];
//        [self.coursesList addObject:course52];
//        [self.coursesList addObject:course53];
//        [self.coursesList addObject:course54];
//        [self.coursesList addObject:course55];
//        [self.coursesList addObject:course56];
//        [self.coursesList addObject:course57];
//        [self.coursesList addObject:course58];
//        [self.coursesList addObject:course59];
//        [self.coursesList addObject:course60];
        [self.coursesList addObject:course61];
        [self.coursesList addObject:course62];
        [self.coursesList addObject:course63];
        [self.coursesList addObject:course64];
        [self.coursesList addObject:course65];
        [self.coursesList addObject:course66];
        [self.coursesList addObject:course67];
        [self.coursesList addObject:course68];
        [self.coursesList addObject:course69];
        [self.coursesList addObject:course70];
        [self.coursesList addObject:course71];
        [self.coursesList addObject:course72];
        [self.coursesList addObject:course73];
        [self.coursesList addObject:course74];
        [self.coursesList addObject:course75];
        [self.coursesList addObject:course76];
        [self.coursesList addObject:course77];
        [self.coursesList addObject:course78];
        [self.coursesList addObject:course79];
        [self.coursesList addObject:course80];
//        [self.coursesList addObject:course81];
//        [self.coursesList addObject:course82];
//        [self.coursesList addObject:course83];
//        [self.coursesList addObject:course84];
//        [self.coursesList addObject:course85];
//        [self.coursesList addObject:course86];
//        [self.coursesList addObject:course87];
//        [self.coursesList addObject:course88];
//        [self.coursesList addObject:course89];
//        [self.coursesList addObject:course90];
        [self saveCourseData];
    }
}


@end

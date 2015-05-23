//
//  CoursesModel.m
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "CoursesModel.h"
#import "Course.h"
#import "Teacher.h"

@implementation CoursesModel

- (void)saveCourseData{
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.coursesList];
   
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"CoursesList"];
    Course *course1 = self.coursesList[0];
    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:course1, nil];
    
    for(Course *course in self.coursesList){
        BOOL flag = false;
        for(NSInteger i = 0; i<array.count;i++){
            Course *cour = array[i];
            if([course.teacher.name isEqualToString:cour.teacher.name]){
                flag = TRUE;
                break;
            }
        }
        if(flag == false){
            [array addObject:course];
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
        
        //教师信息
        
        Teacher *teacher1= [[Teacher alloc]init];
        teacher1.name = @"刘琴";
        teacher1.college = @"同济大学";
        teacher1.school = @"软件学院";
        teacher1.picture = @"LIUQIN";
        teacher1.comment = @"同济大学软件学院教授、博士生导师，软件学院常务副院长，教育部软件工程专业教学指导委员会委员，教育部ACM中国专业委员会委员，中国计算机学会软件工程委员会委员，英国高等教育协会会员，英国高等院校注册讲师，国际测试认证委员会ISTQB大中华分会联合发起人及大中华区首席代表，ISO29119软件与系统测试国际标准Co-editor。";
        
        Teacher *teacher2= [[Teacher alloc]init];
        teacher2.name = @"史扬";
        teacher2.college = @"同济大学";
        teacher2.school = @"软件学院";
        teacher2.picture = @"SHIYANG";
        teacher2.comment = @"工学博士,管理学博士后,现任同济大学软件学院副教授和硕士生导师,有着六年的高级工程师工作经验,曾担任多个项目的主要研究员。";
        
        Teacher *teacher3= [[Teacher alloc]init];
        teacher3.name = @"穆斌";
        teacher3.college = @"同济大学";
        teacher3.school = @"软件学院";
        teacher3.picture = @"MUBIN";
        teacher3.comment = @"同济大学软件学院教授、博士生导师和软件学院副院长,加拿大纽布伦瑞克大学高级访问学者，近两年主持承担了多个国家科技支撑计划重大项目和国家自然科学基金项目。";
        
        Teacher *teacher4= [[Teacher alloc]init];
        teacher4.name = @"尹长青";
        teacher4.college = @"同济大学";
        teacher4.school = @"软件学院";
        teacher4.picture = @"YINCHANGQING";
        teacher4.comment = @"同济大学软件学院副教授,2009年获得国家发明专利一项,其参与的个人数字伙伴软件被评为99年度江苏省科研三等奖。";
        
        Teacher *teacher5= [[Teacher alloc]init];
        teacher5.name = @"曹布阳";
        teacher5.college = @"同济大学";
        teacher5.school = @"软件学院";
        teacher5.picture = @"CAOBUYANG";
        teacher5.comment = @"同济大学软件学院教授,1997年获得美国国家零售业联合体颁发的零售创新技术奖,1998年，因为运营研究和管理科学方面的成就，获得INFORMS（运筹学与管理科学协会）颁发的Franz Edelman Finalist Award,2002年，因为运营研究和管理科学方面的成就，获得INFORMS（运筹学与管理科学协会）颁发的Franz Edelman Finalist Award。";
        
        Teacher *teacher6= [[Teacher alloc]init];
        teacher6.name = @"杜庆峰";
        teacher6.college = @"同济大学";
        teacher6.school = @"软件学院";
        teacher6.picture = @"DUQINGFENG";
        teacher6.comment = @"博士,同济大学软件学院教授和博士生导师。有着丰富的工作经验和项目经历，负责编写的《高级软件测试技术》（清华大学出版社）被教育部作为“十一五”规划教材。";
        
        Teacher *teacher7= [[Teacher alloc]init];
        teacher7.name = @"袁时金";
        teacher7.college = @"同济大学";
        teacher7.school = @"软件学院";
        teacher7.picture = @"YUANSHIJIN";
        teacher7.comment = @"博士,同济大学软件学院副教授。参与了多个国家和地区项目,发表了大量学术论文。";
        
        Teacher *teacher8= [[Teacher alloc]init];
        teacher8.name = @"赵钦佩";
        teacher8.college = @"同济大学";
        teacher8.school = @"软件学院";
        teacher8.picture = @"ZHAOQINPEI";
        teacher8.comment = @"博士,同济大学软件学院讲师。曾荣获芬兰CIMO scholarship。";
        
        Teacher *teacher9= [[Teacher alloc]init];
        teacher9.name = @"金伟祖";
        teacher9.college = @"同济大学";
        teacher9.school = @"软件学院";
        teacher9.picture = @"JINWEIZU";
        teacher9.comment = @"浙江大学计算机系计算机应用硕士毕业,同济大学软件学院讲师。曾担任上启杭软件技术有限公司副总经理，担任过多个科研项目的研发工作。";
        
        Teacher *teacher10= [[Teacher alloc]init];
        teacher10.name = @"周德武";
        teacher10.college = @"上海财经大学";
        teacher10.school = @"经济学院";
        teacher10.picture = @"ZHOUDEWU";
        teacher10.comment = @"博士,上海财经大学著名教师。发表了大量学术论文。";
        
        Teacher *teacher11= [[Teacher alloc]init];
        teacher11.name = @"吴文芳";
        teacher11.college = @"上海财经大学";
        teacher11.school = @"财经法学院";
        teacher11.picture = @"WUWENFANG";
        teacher11.comment = @"中国人民大学法学院、德国明斯特大学法学院联合培养博士研究生,现为上海财经大学讲师,荣获司法资格证和高校教师资格证,熟练地掌握了英语、德语。";
        
        Teacher *teacher12= [[Teacher alloc]init];
        teacher12.name = @"陈芳";
        teacher12.college = @"上海财经大学";
        teacher12.school = @"民商法学院";
        teacher12.picture = @"CHENFANG";
        teacher12.comment = @"上海财经大学讲师。";
        
        Teacher *teacher13= [[Teacher alloc]init];
        teacher13.name = @"叶正茂";
        teacher13.college = @"上海财经大学";
        teacher13.school = @"经济学院";
        teacher13.picture = @"YEZHENGMAO";
        teacher13.comment = @"复旦大学博士毕业,上海财经大学副教授,硕士生导师,兼任中国海派经济学研究中心秘书长、上海市经济学会社会主义市场经济理论分会秘书长、上海工业合作经济研究所兼职研究员等,主要研究企业制度和劳动经济学。";
        
        Teacher *teacher14= [[Teacher alloc]init];
        teacher14.name = @"叶海春";
        teacher14.college = @"上海财经大学";
        teacher14.school = @"经济学院";
        teacher14.picture = @"YEHAICHUN";
        teacher14.comment = @"美国俄克拉荷马大学博士毕业,上海财经大学副教授,主要研究国际金融，宏观经济学，货币经济学，应用计量经济学。";
        
        Teacher *teacher15= [[Teacher alloc]init];
        teacher15.name = @"胡乃红";
        teacher15.college = @"上海财经大学";
        teacher15.school = @"金融学院";
        teacher15.picture = @"HUNAIHONG";
        teacher15.comment = @"上海财经大学在职博士、副教授,主要研究货币银行理论、信用管理、房地产金融，著有《货币银行学习题集》、《房地产金融》等。";
        
        Teacher *teacher16= [[Teacher alloc]init];
        teacher16.name = @"吴以雯";
        teacher16.college = @"上海财经大学";
        teacher16.school = @"金融学院";
        teacher16.picture = @"WUYIWEN";
        teacher16.comment = @"上海财经大学金融学院副教授、硕士生导师,先后多次被评为校优秀青年教师、校骨干教师，曾荣获校教学奖励基金三等奖，多次获得校教学管理成果一等奖和上海市教学管理成果三等奖。";
        
        Teacher *teacher17= [[Teacher alloc]init];
        teacher17.name = @"陈成吒";
        teacher17.college = @"上海财经大学";
        teacher17.school = @"人文学院";
        teacher17.picture = @"CHENCHENGZHA";
        teacher17.comment = @"上海财经大学讲师";
        
        Teacher *teacher18= [[Teacher alloc]init];
        teacher18.name = @"章忠民";
        teacher18.college = @"上海财经大学";
        teacher18.school = @"人文学院";
        teacher18.picture = @"ZHANGZHONGMIN";
        teacher18.comment = @"上海财经大学党校常务副校长，曾任上海财经大学人文学院副院长、党总支副书记（主持总支工作），现在上海财经大学人文学院任教。";
        
        Teacher *teacher19= [[Teacher alloc]init];
        teacher19.name = @"李曜";
        teacher19.college = @"上海财经大学";
        teacher19.school = @"金融学院";
        teacher19.picture = @"LIYAO";
        teacher19.comment = @"上海财经大学金融学院博士生导师,主要研究方向为实证公司金融、公司治理、私募股权与风险投资、证券投资基金、企业年金等。";
        
        Teacher *teacher20= [[Teacher alloc]init];
        teacher20.name = @"阴慧芳";
        teacher20.college = @"上海财经大学";
        teacher20.school = @"会计学院";
        teacher20.picture = @"YINHUIFANG";
        teacher20.comment = @"新加坡南洋理工大学会计博士毕业,上海财经大学会计学院讲师,主要研究方向为分析师，公司治理等。";
        
        Teacher *teacher21= [[Teacher alloc]init];
        teacher21.name = @"三子田";
        teacher21.college = @"上海财经大学";
        teacher21.school = @"会计学院";
        teacher21.picture = @"SANZITIAN";
        teacher21.comment = @"上海财经大学老师";
        
        Teacher *teacher22= [[Teacher alloc]init];
        teacher22.name = @"叶巍岭";
        teacher22.college = @"上海财经大学";
        teacher22.school = @"国际工商管理学院";
        teacher22.picture = @"YEWEILING";
        teacher22.comment = @"上海财经大学国际工商管理学院讲师,主要研究方向为市场营销、广告学、服务营销与客户管理等。";
        
        Teacher *teacher23= [[Teacher alloc]init];
        teacher23.name = @"楼尊";
        teacher23.college = @"上海财经大学";
        teacher23.school = @"商学院";
        teacher23.picture = @"LOUZUN";
        teacher23.comment = @"上海财经大学商学院副教授,从事市场营销领域的教学和研究工作，面向本科、研究生(含MBA)、高级经理短训班等学员开设市场营销、营销管理、国际营销、服务营销、商学等课程，被评为“我心目中的好老师”。";
        
        Teacher *teacher24= [[Teacher alloc]init];
        teacher24.name = @"黄蓉";
        teacher24.college = @"上海财经大学";
        teacher24.school = @"国际工商管理学院";
        teacher24.picture = @"HUANGRONG";
        teacher24.comment = @"上海财经大学国际工商管理学院助理教授,主要研究方向为Brand Equity, Consumer Behavior, Prosocial Behavior, Corporate Social Responsibility, Emotion。";
        
        Teacher *teacher25= [[Teacher alloc]init];
        teacher25.name = @"周海晏";
        teacher25.college = @"复旦大学";
        teacher25.school = @"新闻学院";
        teacher25.picture = @"ZHOUHAIYAN";
        teacher25.comment = @"复旦大学新闻学院讲师,主要研究方向为政治传播、城市传播、新媒体传播,出版专著《新社会运动视域下中国网络环保行动研究》，发表论文10余篇，主持或参与科研项目10余项，至今在全国各类报刊、杂志上公开发表新闻稿或文章140余篇。";
        
        Teacher *teacher26= [[Teacher alloc]init];
        teacher26.name = @"程向前";
        teacher26.college = @"复旦大学";
        teacher26.school = @"经济学院";
        teacher26.picture = @"CHENGXIANGQIAN";
        teacher26.comment = @"复旦大学经济学院副教授。";
        
        Teacher *teacher27= [[Teacher alloc]init];
        teacher27.name = @"陈晓云";
        teacher27.college = @"复旦大学";
        teacher27.school = @"社会发展与公共政策学院";
        teacher27.picture = @"CHENXIAOYUN";
        teacher27.comment = @"心理学博士，理论经济学博士后。社会兼职有受聘联合国儿童基金会项目技术支持专家、韩国首尔大学客座研究员、上海市总工会女职工心理援助专家。曾获商务部“全国商务发展研究成果奖”，第十四届“安子介国际贸易研究奖”，上海市人大常委会课题研究一等奖，省高校科研成果一等奖、市级社科成果一等奖，以及复旦大学2005、2009年度“优秀导师”等十余项奖励。";
        
        Teacher *teacher28= [[Teacher alloc]init];
        teacher28.name = @"金理";
        teacher28.college = @"复旦大学";
        teacher28.school = @"中文系";
        teacher28.picture = @"JINLI";
        teacher28.comment = @"复旦大学文学博士，历史学博士后，现任教于复旦大学中文系，青年学者、批评家，研究方向为20世纪中国文学史、当代文学批评。在《文学评论》、《中国现代文学研究丛刊》、《文艺争鸣》、《文艺理论研究》、《当代作家评论》、《南方文坛》等刊物上发表论文若干，部分被“人大复印资料”、《中国社会科学文摘》等转载，出版学术专著《从兰社到<现代>：以施蛰存、戴望舒、杜衡与刘呐鸥为核心的社团研究》（东方出版中心2006年6月）。";
        
        Teacher *teacher29= [[Teacher alloc]init];
        teacher29.name = @"汪涌豪";
        teacher29.college = @"复旦大学";
        teacher29.school = @"中文系";
        teacher29.picture = @"WANGYONGHAO";
        teacher29.comment = @"复旦大学中文系教授，博士生导师，国务院政府特殊津贴专家。曾为日本九州大学客座教授，神户大学特任教授。主治中国古代文学与美学，兼及古代哲学、史学与文化批评。著作有《中国文学批评范畴及体系》《言说的立场》等14种；曾获教育部和上海市高校优秀青年教师奖、霍英东教育基金会奖、中国国家图书奖、上海市优秀图书一等奖，以及省部级哲学社会科学优秀成果一至三等奖多项。";
        
        Teacher *teacher30= [[Teacher alloc]init];
        teacher30.name = @"盛青";
        teacher30.college = @"复旦大学";
        teacher30.school = @"中文系";
        teacher30.picture = @"SHENGQING";
        teacher30.comment = @"1991年毕业于复旦大学中文系汉语言专业。毕业留校任教，在中文系从事本科生的现代汉语教学，其间参加南开大学主办的\"实验语音学培训班\"。1995年起同时从事对外汉语教学，1997年-1998年赴韩国讲学。2001年调至国际文化交流学院任教。";
        
        Teacher *teacher31= [[Teacher alloc]init];
        teacher31.name = @"谢静";
        teacher31.college = @"复旦大学";
        teacher31.school = @"新闻学院";
        teacher31.picture = @"XIEJING";
        teacher31.comment = @"博士，教授，复旦大学新闻学院党总支副书记。主持的科研项目主要有教育部人文社会科学研究“十五”规划第一批研究项目 “媒介批评的理论与实践”，复旦大学文科科研推进计划金苗项目“企业传播的理论与实践”等。参与教育部哲学社会科学研究重大课题攻关项目“媒介素质教育理论与实践研究”。个人专著有《建构权威·协商规范——美国新闻媒介批评解读》、《中外优秀新闻作品鉴赏》，主译美国教材《广播电视与新媒体写作》。";
        
        Teacher *teacher32= [[Teacher alloc]init];
        teacher32.name = @"曹晋";
        teacher32.college = @"复旦大学";
        teacher32.school = @"新闻学院";
        teacher32.picture = @"CAOJIN";
        teacher32.comment = @"复旦大学新闻学院教授、博士生导师，学术研究聚焦传播政治经济学、社会性别与媒介研究、书刊出版研究。讲授《出版学导论》、《媒介与社会性别研究》（双语）、《杂志研究》、《传播政治经济学》（双语，2010秋季）等本科课程和《大众传播与当代社会》、《书刊出版研究》（含传播政治经济学）等研究生课程。";
        
        Teacher *teacher33= [[Teacher alloc]init];
        teacher33.name = @"朱春阳";
        teacher33.college = @"复旦大学";
        teacher33.school = @"新闻学院";
        teacher33.picture = @"ZHUCHUNYANG";
        teacher33.comment = @"媒介管理学博士。现为复旦大学新闻学院副教授、媒介管理学专业硕士生导师。主持省部级项目、媒体或政府横向合作项目10余项，发表媒介管理类论文80余篇，担任多家国内传媒集团与海外驻华传媒机构兼职研究员、咨询顾问、培训师。国家哲学社科创新平台“复旦大学新闻传播与媒介化社会研究”基地副研究员、教育部传播学重点研究基地“复旦大学信息与传播研究中心”专职研究员、CSSCI期刊《新闻大学》媒介管理栏目、广告与公关栏目主编；华东师范大学MPA传媒管理专业主讲教师、第一、二、三届中国传媒创新年会专家评委会委员。";
        
        Teacher *teacher34= [[Teacher alloc]init];
        teacher34.name = @"徐建牛";
        teacher34.college = @"复旦大学";
        teacher34.school = @"社会发展与公共政策学院";
        teacher34.picture = @"XUJIANNIU";
        teacher34.comment = @"毕业于中山大学社会学系，法学博士。现任复旦大学社会发展与公共政策学院社会学系副教授。";
        
        Teacher *teacher35= [[Teacher alloc]init];
        teacher35.name = @"王威海";
        teacher35.college = @"复旦大学";
        teacher35.school = @"社会发展与公共政策学院";
        teacher35.picture = @"WANGWEIHAI";
        teacher35.comment = @"复旦大学政治学研究生、博士。政治学博士。现任复旦大学社会发展与公共政策学院社会学系副教授。《西方社会思想史》课程教学创新设计与实践，2000年上海市教学成果奖一等奖、国家级教学成果奖二等奖。";
        
        Teacher *teacher36= [[Teacher alloc]init];
        teacher36.name = @"姚军";
        teacher36.college = @"复旦大学";
        teacher36.school = @"法学院";
        teacher36.picture = @"YAOJUN";
        teacher36.comment = @"复旦大学法学院副教授，学科领域为保密法和卫生法。";
        
        Teacher *teacher37 = [[Teacher alloc]init];
        teacher37.name = @"杨晓畅";
        teacher37.college = @"复旦大学";
        teacher37.school = @"法学院";
        teacher37.picture = @"YANGXIAOCHANG";
        teacher37.comment = @"复旦大学法学院讲师、法学博士。主要研究方向为法理学、法哲学和政治哲学（尤重罗尔斯自由主义理论研究），已出版学术编著1部、学术专著1部，在《法学评论》、《法制与社会发展》、《求是学刊》、《学习与探索》、《中国社会科学辑刊》、《复旦政治哲学评论》等刊物发表各类学术文章（含译文）30余篇。2006年吉林大学法学学士，2008年吉林大学法学硕士，2011年吉林大学法学博士。职业经历为：2011-2013年，复旦大学国际关系与公共事务学院政治学流动站博士后。2014至今，复旦大学法学院。";
        
        Teacher *teacher38 = [[Teacher alloc]init];
        teacher38.name = @"侯健";
        teacher38.college = @"复旦大学";
        teacher38.school = @"法学院";
        teacher38.picture = @"HOUJIAN";
        teacher38.comment = @"1992年毕业于安徽师范大学历史系，获历史学学士学位；1997年毕业于北京大学法律系，获法学硕士学位；2000年毕业于北京大学法学院，获法学博士学位。2000年8月起工作于复旦大学法学院，现任教授。主要研究领域为法理学、人权理论、表达自由的理论与制度。主讲《法学基础理论》、《法理学》、《人权与法》等课程。发表的学术作品主要有专著《舆论监督与名誉权问题研究》、《表达自由的法理》、《人文主义法学思潮》，论文40多篇和译著4种。";
        
        Teacher *teacher39= [[Teacher alloc]init];
        teacher39.name = @"李晓茹";
        teacher39.college = @"复旦大学";
        teacher39.school = @"心理学院";
        teacher39.picture = @"LIXIAORU";
        teacher39.comment = @"复旦大学心理学系副教授、副系主任。擅长领域为大学生心理健康。教龄6年。";
        
        Teacher *teacher40= [[Teacher alloc]init];
        teacher40.name = @"高隽";
        teacher40.college = @"复旦大学";
        teacher40.school = @"公共发展与社会政策学院";
        teacher40.picture = @"GAOJUAN";
        teacher40.comment = @"理学博士，中共党员，复旦大学公共发展与社会政策学院心理学系讲师, 中国心理学会临床心理学专业人员与机构注册系统注册心理师（2012-2014，注册号：X-12-007）。2005年北京大学心理学系理学学士，2010年北京大学心理学系基础心理学临床心理学专业理学博士。已在国内外专业学术期刊发表论文31篇，其中SSCI期刊第一作者2篇，第二作者1篇，第三作者1篇，国内CSSCI收录期刊第一作者/通讯作者10篇，第二作者7篇。已出版专业译著5本。曾主讲的课程包括：心理学导论、人格心理学、团体心理训练、心理测量、心理咨询与治疗导论等。";
        
        Teacher *teacher41= [[Teacher alloc]init];
        teacher41.name = @"陈金华";
        teacher41.college = @"复旦大学";
        teacher41.school = @"社会学院";
        teacher41.picture = @"CHENJINHUA";
        teacher41.comment = @"中共党员，哲学博士，副教授，硕士生导师。1982年毕业于华东师范大学政治教育系，1982年至1985年在清华大学附属中学工作。先后在1988年、1999年获得复旦大学哲学硕士和博士学位。自1988年至今，在复旦大学社会科学基础部工作，现任思想政治教育教研室主任。";
        
        Teacher *teacher42= [[Teacher alloc]init];
        teacher42.name = @"汪洪章";
        teacher42.college = @"复旦大学";
        teacher42.school = @"外国语言文学学院";
        teacher42.picture = @"WANGHONGZHANG";
        teacher42.comment = @"复旦大学外国语言文学学院教授、外国文学研究所副所长、文学博士 博士生导师。1991年毕业于复旦大学外文系，获文学硕士学位并留校工作至今，1996年起任副教授。1999年毕业于复旦大学外文系英语语言文学专业，获文学博士学位。2002年7月至2003年7月获美国Freeman Foundation资助，以Visiting Professor 身份在美国伊利诺依州立大学访学一年。";
        
        Teacher *teacher43= [[Teacher alloc]init];
        teacher43.name = @"程群";
        teacher43.college = @"复旦大学";
        teacher43.school = @"哲学学院";
        teacher43.picture = @"CHENGQUN";
        teacher43.comment = @"主要以佛教哲学、天台学等为主要研究方向，现任复旦哲学学院宗教研究室讲师。先后发表《一色一香，无非中道——智顗〈观心食法〉解读》、《〈唯心诀〉解读》、《佛教的现代伦理学诠释》、《〈随自意三昧〉及其当代意义》等专业论文数篇。讲授课程有：（本科）“佛学原典选读”、“佛教哲学”、“哲学原典导读：《维摩诘经》”以及（研究生）“佛学原典精读”等。";
        
        Teacher *teacher44= [[Teacher alloc]init];
        teacher44.name = @"钱箭星";
        teacher44.college = @"复旦大学";
        teacher44.school = @"马克思学院";
        teacher44.picture = @"QIANJIANXING";
        teacher44.comment = @"教授，硕士生导师，中国化教研室";
        
        
        
        //课程信息
        //同济大学课程
        Course *course1 = [[Course alloc]init];
        course1.name = @"软件测试技术";
        course1.teacher = teacher1;
        course1.school = @"TONGJI";
        course1.weekDate = [NSNumber numberWithInt:3];
        course1.dayTime = [NSNumber numberWithInt:2];
        course1.room = @"济事楼430";
        course1.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course2 = [[Course alloc]init];
        course2.name = @"软件测试技术";
        course2.teacher = teacher1;
        course2.school = @"TONGJI";
        course2.weekDate = [NSNumber numberWithInt:5];
        course2.dayTime = [NSNumber numberWithInt:2];
        course2.room = @"济事楼434";
        course2.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course3 = [[Course alloc]init];
        course3.name = @"软件复用";
        course3.teacher = teacher2;
        course3.school = @"TONGJI";
        course3.weekDate = [NSNumber numberWithInt:5];
        course3.dayTime = [NSNumber numberWithInt:4];
        course3.room = @"济事楼516";
        course3.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course4 = [[Course alloc]init];
        course4.name = @"软件复用";
        course4.teacher = teacher2;
        course4.school = @"TONGJI";
        course4.weekDate = [NSNumber numberWithInt:6];
        course4.dayTime = [NSNumber numberWithInt:1];
        course4.room = @"济事楼516";
        course4.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course5 = [[Course alloc]init];
        course5.name = @".net体系结构与设计开发";
        course5.teacher = teacher2;
        course5.school = @"TONGJI";
        course5.weekDate = [NSNumber numberWithInt:5];
        course5.dayTime = [NSNumber numberWithInt:3];
        course5.room = @"济事楼516";
        course5.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course6 = [[Course alloc]init];
        course6.name = @".net体系结构与设计开发";
        course6.teacher = teacher2;
        course6.school = @"TONGJI";
        course6.weekDate = [NSNumber numberWithInt:3];
        course6.dayTime = [NSNumber numberWithInt:4];
        course6.room = @"济事楼516";
        course6.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course7 = [[Course alloc]init];
        course7.name = @"离散数学";
        course7.teacher = teacher2;
        course7.school = @"TONGJI";
        course7.weekDate = [NSNumber numberWithInt:2];
        course7.dayTime = [NSNumber numberWithInt:4];
        course7.room = @"北420";
        course7.address = @"上海市杨浦区同济大学北楼";
        
        Course *course8 = [[Course alloc]init];
        course8.name = @"离散数学";
        course8.teacher = teacher2;
        course8.school = @"TONGJI";
        course8.weekDate = [NSNumber numberWithInt:5];
        course8.dayTime = [NSNumber numberWithInt:1];
        course8.room = @"北420";
        course8.address = @"上海市杨浦区同济大学北楼";
        
        Course *course9 = [[Course alloc]init];
        course9.name = @"数据库原理与应用";
        course9.teacher = teacher3;
        course9.school = @"TONGJI";
        course9.weekDate = [NSNumber numberWithInt:5];
        course9.dayTime = [NSNumber numberWithInt:1];
        course9.room = @"B406";
        course9.address = @"上海市嘉定区同济大学博楼";
        
        Course *course10 = [[Course alloc]init];
        course10.name = @"数据库原理与应用";
        course10.teacher = teacher3;
        course10.school = @"TONGJI";
        course10.weekDate = [NSNumber numberWithInt:3];
        course10.dayTime = [NSNumber numberWithInt:2];
        course10.room = @"B406";
        course10.address = @"上海市嘉定区同济大学博楼";
        
        Course *course11 = [[Course alloc]init];
        course11.name = @"数据库原理与应用";
        course11.teacher = teacher3;
        course11.school = @"TONGJI";
        course11.weekDate = [NSNumber numberWithInt:3];
        course11.dayTime = [NSNumber numberWithInt:1];
        course11.room = @"B406";
        course11.address = @"上海市嘉定区同济大学博楼";
        
        Course *course12 = [[Course alloc]init];
        course12.name = @"数据库原理与应用";
        course12.teacher = teacher3;
        course12.school = @"TONGJI";
        course12.weekDate = [NSNumber numberWithInt:5];
        course12.dayTime = [NSNumber numberWithInt:2];
        course12.room = @"B406";
        course12.address = @"上海市嘉定区同济大学博楼";
        
        Course *course13 = [[Course alloc]init];
        course13.name = @"软件架构与设计模式";
        course13.teacher = teacher4;
        course13.school = @"TONGJI";
        course13.weekDate = [NSNumber numberWithInt:2];
        course13.dayTime = [NSNumber numberWithInt:5];
        course13.room = @"济事楼434";
        course13.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course14 = [[Course alloc]init];
        course14.name = @"软件架构与设计模式";
        course14.teacher = teacher4;
        course14.school = @"TONGJI";
        course14.weekDate = [NSNumber numberWithInt:4];
        course14.dayTime = [NSNumber numberWithInt:5];
        course14.room = @"济事楼434";
        course14.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course15 = [[Course alloc]init];
        course15.name = @"信息安全基础";
        course15.teacher = teacher4;
        course15.school = @"TONGJI";
        course15.weekDate = [NSNumber numberWithInt:4];
        course15.dayTime = [NSNumber numberWithInt:4];
        course15.room = @"济事楼516";
        course15.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course16 = [[Course alloc]init];
        course16.name = @"信息安全基础";
        course16.teacher = teacher4;
        course16.school = @"TONGJI";
        course16.weekDate = [NSNumber numberWithInt:2];
        course16.dayTime = [NSNumber numberWithInt:4];
        course16.room = @"济事楼516";
        course16.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course17 = [[Course alloc]init];
        course17.name = @"GIS导论";
        course17.teacher = teacher5;
        course17.school = @"TONGJI";
        course17.weekDate = [NSNumber numberWithInt:6];
        course17.dayTime = [NSNumber numberWithInt:3];
        course17.room = @"济事楼430";
        course17.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course18 = [[Course alloc]init];
        course18.name = @"软件项目管理";
        course18.teacher = teacher5;
        course18.school = @"TONGJI";
        course18.weekDate = [NSNumber numberWithInt:4];
        course18.dayTime = [NSNumber numberWithInt:2];
        course18.room = @"济事楼430";
        course18.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course19 = [[Course alloc]init];
        course19.name = @"软件项目管理";
        course19.teacher = teacher5;
        course19.school = @"TONGJI";
        course19.weekDate = [NSNumber numberWithInt:6];
        course19.dayTime = [NSNumber numberWithInt:2];
        course19.room = @"济事楼430";
        course19.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course20 = [[Course alloc]init];
        course20.name = @"GIS导论";
        course20.teacher = teacher5;
        course20.school = @"TONGJI";
        course20.weekDate = [NSNumber numberWithInt:4];
        course20.dayTime = [NSNumber numberWithInt:3];
        course20.room = @"济事楼430";
        course20.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course21 = [[Course alloc]init];
        course21.name = @"软件项目管理";
        course21.teacher = teacher6;
        course21.school = @"TONGJI";
        course21.weekDate = [NSNumber numberWithInt:3];
        course21.dayTime = [NSNumber numberWithInt:1];
        course21.room = @"济事楼430";
        course1.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course22 = [[Course alloc]init];
        course22.name = @"软件项目管理";
        course22.teacher = teacher6;
        course22.school = @"TONGJI";
        course22.weekDate = [NSNumber numberWithInt:5];
        course22.dayTime = [NSNumber numberWithInt:1];
        course22.room = @"济事楼430";
        course22.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course23 = [[Course alloc]init];
        course23.name = @"软件测试技术";
        course23.teacher = teacher6;
        course23.school = @"TONGJI";
        course23.weekDate = [NSNumber numberWithInt:3];
        course23.dayTime = [NSNumber numberWithInt:2];
        course23.room = @"济事楼430";
        course23.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course24 = [[Course alloc]init];
        course24.name = @"软件测试技术";
        course24.teacher = teacher6;
        course24.school = @"TONGJI";
        course24.weekDate = [NSNumber numberWithInt:5];
        course24.dayTime = [NSNumber numberWithInt:2];
        course24.room = @"济事楼430";
        course24.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course25 = [[Course alloc]init];
        course25.name = @"数据库原理与应用";
        course25.teacher = teacher7;
        course25.school = @"TONGJI";
        course25.weekDate = [NSNumber numberWithInt:4];
        course25.dayTime = [NSNumber numberWithInt:2];
        course25.room = @"A106";
        course25.address = @"上海市嘉定区同济大学安楼";
        
        Course *course26 = [[Course alloc]init];
        course26.name = @"数据库原理与应用";
        course26.teacher = teacher7;
        course26.school = @"TONGJI";
        course26.weekDate = [NSNumber numberWithInt:6];
        course26.dayTime = [NSNumber numberWithInt:2];
        course26.room = @"A106";
        course26.address = @"上海市嘉定区同济大学安楼";
        
        Course *course27 = [[Course alloc]init];
        course27.name = @"面向对象程序设计";
        course27.teacher = teacher8;
        course27.school = @"TONGJI";
        course27.weekDate = [NSNumber numberWithInt:3];
        course27.dayTime = [NSNumber numberWithInt:1];
        course27.room = @"北206";
        course27.address = @"上海市杨浦区同济大学北楼";
        
        Course *course28 = [[Course alloc]init];
        course28.name = @"面向对象程序设计";
        course28.teacher = teacher8;
        course28.school = @"TONGJI";
        course28.weekDate = [NSNumber numberWithInt:5];
        course28.dayTime = [NSNumber numberWithInt:1];
        course28.room = @"北206";
        course28.address = @"上海市杨浦区同济大学北楼";
        
        Course *course29 = [[Course alloc]init];
        course29.name = @"软件过程与管理";
        course29.teacher = teacher8;
        course29.school = @"TONGJI";
        course29.weekDate = [NSNumber numberWithInt:2];
        course29.dayTime = [NSNumber numberWithInt:1];
        course29.room = @"北206";
        course29.address = @"上海市嘉定区同济大学济事楼";
        
        Course *course30 = [[Course alloc]init];
        course30.name = @"java EE";
        course30.teacher = teacher9;
        course30.school = @"TONGJI";
        course30.weekDate = [NSNumber numberWithInt:3];
        course30.dayTime = [NSNumber numberWithInt:1];
        course30.room = @"济事楼430";
        course30.address = @"上海市嘉定区同济大学济事楼";
        
        //上海财经大学课程
        Course *course31 = [[Course alloc]init];
        course31.name = @"中级微观经济学";
        course31.teacher = teacher10;
        course31.school = @"SHANGHAICAIJING";
        course31.weekDate = [NSNumber numberWithInt:4];
        course31.dayTime = [NSNumber numberWithInt:2];
        course31.room = @"二教415";
        course31.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course32 = [[Course alloc]init];
        course32.name = @"中级微观经济学";
        course32.teacher = teacher10;
        course32.school = @"SHANGHAICAIJING";
        course32.weekDate = [NSNumber numberWithInt:6];
        course32.dayTime = [NSNumber numberWithInt:1];
        course32.room = @"二教415";
        course32.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course33 = [[Course alloc]init];
        course33.name = @"经济法概论";
        course33.teacher = teacher11;
        course33.school = @"SHANGHAICAIJING";
        course33.weekDate = [NSNumber numberWithInt:5];
        course33.dayTime = [NSNumber numberWithInt:5];
        course33.room = @"武东路梯五";
        course33.address = @"上海财经大学(武东路校区)武东路梯教";
        
        Course *course34 = [[Course alloc]init];
        course34.name = @"经济法概论";
        course34.teacher = teacher12;
        course34.school = @"SHANGHAICAIJING";
        course34.weekDate = [NSNumber numberWithInt:6];
        course34.dayTime = [NSNumber numberWithInt:2];
        course34.room = @"一教205";
        course34.address = @"上海市杨浦区上海财经大学第一教学楼";
        
        Course *course35 = [[Course alloc]init];
        course35.name = @"中级宏观经济学";
        course35.teacher = teacher13;
        course35.school = @"SHANGHAICAIJING";
        course35.weekDate = [NSNumber numberWithInt:4];
        course35.dayTime = [NSNumber numberWithInt:5];
        course35.room = @"二教205";
        course35.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course36 = [[Course alloc]init];
        course36.name = @"经济学思想与方法";
        course36.teacher = teacher14;
        course36.school = @"SHANGHAICAIJING";
        course36.weekDate = [NSNumber numberWithInt:6];
        course36.dayTime = [NSNumber numberWithInt:5];
        course36.room = @"国定路梯三";
        course36.address = @"上海财经大学(武川路校区)经济学院梯教";
        
        Course *course37 = [[Course alloc]init];
        course37.name = @"货币银行学";
        course37.teacher = teacher15;
        course37.school = @"SHANGHAICAIJING";
        course37.weekDate = [NSNumber numberWithInt:4];
        course37.dayTime = [NSNumber numberWithInt:4];
        course37.room = @"三教303";
        course37.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course38 = [[Course alloc]init];
        course38.name = @"货币银行学";
        course38.teacher = teacher15;
        course38.school = @"SHANGHAICAIJING";
        course38.weekDate = [NSNumber numberWithInt:4];
        course38.dayTime = [NSNumber numberWithInt:2];
        course38.room = @"三教201";
        course38.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course39 = [[Course alloc]init];
        course39.name = @"货币银行学";
        course39.teacher = teacher16;
        course39.school = @"SHANGHAICAIJING";
        course39.weekDate = [NSNumber numberWithInt:4];
        course39.dayTime = [NSNumber numberWithInt:2];
        course39.room = @"三教301";
        course39.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course40 = [[Course alloc]init];
        course40.name = @"货币银行学";
        course40.teacher = teacher16;
        course40.school = @"SHANGHAICAIJING";
        course40.weekDate = [NSNumber numberWithInt:4];
        course40.dayTime = [NSNumber numberWithInt:4];
        course40.room = @"三教301";
        course40.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course41 = [[Course alloc]init];
        course41.name = @"先秦诸子文学";
        course41.teacher = teacher17;
        course41.school = @"SHANGHAICAIJING";
        course41.weekDate = [NSNumber numberWithInt:6];
        course41.dayTime = [NSNumber numberWithInt:4];
        course41.room = @"武东路梯六";
        course41.address = @"上海财经大学(武东路校区)武东路梯教";
        
        Course *course42 = [[Course alloc]init];
        course42.name = @"黑格尔哲学";
        course42.teacher = teacher18;
        course42.school = @"SHANGHAICAIJING";
        course42.weekDate = [NSNumber numberWithInt:5];
        course42.dayTime = [NSNumber numberWithInt:4];
        course42.room = @"国定路梯四";
        course42.address = @"上海财经大学(武川路校区)经济学院梯教";
        
        Course *course43 = [[Course alloc]init];
        course43.name = @"公司金融";
        course43.teacher = teacher19;
        course43.school = @"SHANGHAICAIJING";
        course43.weekDate = [NSNumber numberWithInt:1];
        course43.dayTime = [NSNumber numberWithInt:1];
        course43.room = @"博思楼403";
        course43.address = @"上海财经大学博思楼";
        
        Course *course44 = [[Course alloc]init];
        course44.name = @"财务会计";
        course44.teacher = teacher20;
        course44.school = @"SHANGHAICAIJING";
        course44.weekDate = [NSNumber numberWithInt:2];
        course44.dayTime = [NSNumber numberWithInt:4];
        course44.room = @"三教204";
        course44.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course45 = [[Course alloc]init];
        course45.name = @"财务会计";
        course45.teacher = teacher20;
        course45.school = @"SHANGHAICAIJING";
        course45.weekDate = [NSNumber numberWithInt:4];
        course45.dayTime = [NSNumber numberWithInt:4];
        course45.room = @"三教204";
        course45.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course46 = [[Course alloc]init];
        course46.name = @"财务会计";
        course46.teacher = teacher21;
        course46.school = @"SHANGHAICAIJING";
        course46.weekDate = [NSNumber numberWithInt:2];
        course46.dayTime = [NSNumber numberWithInt:4];
        course46.room = @"二教207";
        course46.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course47 = [[Course alloc]init];
        course47.name = @"财务会计";
        course47.teacher = teacher21;
        course47.school = @"SHANGHAICAIJING";
        course47.weekDate = [NSNumber numberWithInt:4];
        course47.dayTime = [NSNumber numberWithInt:4];
        course47.room = @"二教207";
        course47.address = @"上海市杨浦区上海财经大学第二教学楼";
        
        Course *course48 = [[Course alloc]init];
        course48.name = @"市场营销学";
        course48.teacher = teacher22;
        course48.school = @"SHANGHAICAIJING";
        course48.weekDate = [NSNumber numberWithInt:6];
        course48.dayTime = [NSNumber numberWithInt:3];
        course48.room = @"三教209";
        course48.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course49 = [[Course alloc]init];
        course49.name = @"市场营销学";
        course49.teacher = teacher23;
        course49.school = @"SHANGHAICAIJING";
        course49.weekDate = [NSNumber numberWithInt:5];
        course49.dayTime = [NSNumber numberWithInt:4];
        course49.room = @"三教503";
        course49.address = @"上海市杨浦区上海财经大学第三教学楼";
        
        Course *course50 = [[Course alloc]init];
        course50.name = @"市场营销学";
        course50.teacher = teacher24;
        course50.school = @"SHANGHAICAIJING";
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
        course61.teacher = teacher25;
        course61.school = @"FUDAN";
        course61.weekDate = [NSNumber numberWithInt:6];
        course61.dayTime = [NSNumber numberWithInt:2];
        course61.room = @" HQ201";
        course61.address = @"复旦大学新闻学院教学楼";
        
        Course *course62 = [[Course alloc]init];
        course62.name = @"微观经济学A";
        course62.teacher = teacher26;
        course62.school = @"FUDAN";
        course62.weekDate = [NSNumber numberWithInt:5];
        course62.dayTime = [NSNumber numberWithInt:2];
        course62.room = @"H6207";
        course62.address = @"复旦大学第六教学楼";
        
        Course *course63 = [[Course alloc]init];
        course63.name = @"现代西方心理学名著导读";
        course63.teacher = teacher27;
        course63.school = @"FUDAN";
        course63.weekDate = [NSNumber numberWithInt:4];
        course63.dayTime = [NSNumber numberWithInt:2];
        course63.room = @"H6201";
        course63.address = @"复旦大学第六教学楼";
        
        Course *course64 = [[Course alloc]init];
        course64.name = @"文学原典导读";
        course64.teacher = teacher28;
        course64.school = @"FUDAN";
        course64.weekDate = [NSNumber numberWithInt:4];
        course64.dayTime = [NSNumber numberWithInt:2];
        course64.room = @"HGX508";
        course64.address = @"复旦大学光华楼西辅楼";
        
        Course *course65 = [[Course alloc]init];
        course65.name = @"中国文学传统";
        course65.teacher = teacher29;
        course65.school = @"FUDAN";
        course65.weekDate = [NSNumber numberWithInt:2];
        course65.dayTime = [NSNumber numberWithInt:2];
        course65.room = @"HGX104";
        course65.address = @"复旦大学光华楼西辅楼";
        
        Course *course66 = [[Course alloc]init];
        course66.name = @"中国传统戏剧赏析";
        course66.teacher = teacher30;
        course66.school = @"FUDAN";
        course66.weekDate = [NSNumber numberWithInt:5];
        course66.dayTime = [NSNumber numberWithInt:4];
        course66.room = @"HGD510";
        course66.address = @"复旦大学光华楼东辅楼";
        
        Course *course67 = [[Course alloc]init];
        course67.name = @"组织传播学";
        course67.teacher = teacher31;
        course67.school = @"FUDAN";
        course67.weekDate = [NSNumber numberWithInt:5];
        course67.dayTime = [NSNumber numberWithInt:2];
        course67.room = @"HQ303";
        course67.address = @"复旦大学新闻学院教学楼";
        
        Course *course68 = [[Course alloc]init];
        course68.name = @"媒介与社会性别";
        course68.teacher = teacher32;
        course68.school = @"FUDAN";
        course68.weekDate = [NSNumber numberWithInt:2];
        course68.dayTime = [NSNumber numberWithInt:2];
        course68.room = @"HQ201";
        course68.address = @"复旦大学新闻学院教学楼";
        
        Course *course69 = [[Course alloc]init];
        course69.name = @"政府公共关系";
        course69.teacher = teacher33;
        course69.school = @"FUDAN";
        course69.weekDate = [NSNumber numberWithInt:4];
        course69.dayTime = [NSNumber numberWithInt:4];
        course69.room = @"HQ201";
        course69.address = @"复旦大学新闻学院教学楼";
        
        Course *course70 = [[Course alloc]init];
        course70.name = @"社会学导论";
        course70.teacher = teacher34;
        course70.school = @"FUDAN";
        course70.weekDate = [NSNumber numberWithInt:2];
        course70.dayTime = [NSNumber numberWithInt:5];
        course70.room = @"H6112";
        course70.address = @"复旦大学第六教学楼";
        
        Course *course71 = [[Course alloc]init];
        course71.name = @"社会学导论";
        course71.teacher = teacher35;
        course71.school = @"FUDAN";
        course71.weekDate = [NSNumber numberWithInt:3];
        course71.dayTime = [NSNumber numberWithInt:2];
        course71.room = @"H6412";
        course71.address = @"复旦大学第六教学楼";
        
        Course *course72 = [[Course alloc]init];
        course72.name = @"法学基础理论";
        course72.teacher = teacher36;
        course72.school = @"FUDAN";
        course72.weekDate = [NSNumber numberWithInt:2];
        course72.dayTime = [NSNumber numberWithInt:2];
        course72.room = @"H6112";
        course72.address = @"复旦大学第六教学楼";
        
        Course *course73 = [[Course alloc]init];
        course73.name = @"法学基础理论";
        course73.teacher = teacher37;
        course73.school = @"FUDAN";
        course73.weekDate = [NSNumber numberWithInt:5];
        course73.dayTime = [NSNumber numberWithInt:2];
        course73.room = @"H3308";
        course73.address = @"复旦大学第三教学楼";
        
        Course *course74 = [[Course alloc]init];
        course74.name = @"法学基础理论";
        course74.teacher = teacher38;
        course74.school = @"FUDAN";
        course74.weekDate = [NSNumber numberWithInt:4];
        course74.dayTime = [NSNumber numberWithInt:4];
        course74.room = @"H4101";
        course74.address = @"复旦大学第四教学楼";
        
        Course *course75 = [[Course alloc]init];
        course75.name = @"心理学导论";
        course75.teacher = teacher39;
        course75.school = @"FUDAN";
        course75.weekDate = [NSNumber numberWithInt:6];
        course75.dayTime = [NSNumber numberWithInt:4];
        course75.room = @"H6312";
        course75.address = @"复旦大学第六教学楼";
        
        Course *course76 = [[Course alloc]init];
        course76.name = @"心理学导论";
        course76.teacher = teacher40;
        course76.school = @"FUDAN";
        course76.weekDate = [NSNumber numberWithInt:6];
        course76.dayTime = [NSNumber numberWithInt:5];
        course76.room = @"H6101";
        course76.address = @"复旦大学第六教学楼";
        
        Course *course77 = [[Course alloc]init];
        course77.name = @"应用伦理学";
        course77.teacher = teacher41;
        course77.school = @"FUDAN";
        course77.weekDate = [NSNumber numberWithInt:5];
        course77.dayTime = [NSNumber numberWithInt:4];
        course77.room = @"H3306";
        course77.address = @"复旦大学第三教学楼";
        
        Course *course78 = [[Course alloc]init];
        course78.name = @"世界文学导读";
        course78.teacher = teacher42;
        course78.school = @"FUDAN";
        course78.weekDate = [NSNumber numberWithInt:4];
        course78.dayTime = [NSNumber numberWithInt:4];
        course78.room = @"H6112";
        course78.address = @"复旦大学第六教学楼";
        
        Course *course79 = [[Course alloc]init];
        course79.name = @"哲学原典导读";
        course79.teacher = teacher43;
        course79.school = @"FUDAN";
        course79.weekDate = [NSNumber numberWithInt:4];
        course79.dayTime = [NSNumber numberWithInt:3];
        course79.room = @"HGX507";
        course79.address = @"复旦大学光华楼西辅楼";
        
        Course *course80 = [[Course alloc]init];
        course80.name = @"当代世界经济与政治";
        course80.teacher = teacher44;
        course80.school = @"FUDAN";
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
//
//        
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
////        [self.coursesList addObject:course51];
////        [self.coursesList addObject:course52];
////        [self.coursesList addObject:course53];
////        [self.coursesList addObject:course54];
////        [self.coursesList addObject:course55];
////        [self.coursesList addObject:course56];
////        [self.coursesList addObject:course57];
////        [self.coursesList addObject:course58];
////        [self.coursesList addObject:course59];
////        [self.coursesList addObject:course60];
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
//        [self.coursesList addObject:course1];
        [self saveCourseData];
    }
}


@end

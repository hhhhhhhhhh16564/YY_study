//
//  UrlHeader.h
//  七月算法_iPad
//
//  Created by pro on 16/5/29.
//  Copyright © 2016年 zhl. All rights reserved.
//

#ifndef UrlHeader_h
#define UrlHeader_h



//注册
#define registerURL @"https://api.julyedu.com/u/r"

//登录
#define loginURL @"https://api.julyedu.com/u/l"

//第三方登录
#define thirdLoginURL @"https://api.julyedu.com/u/3l"


//首页 get

#define homeURL @"https://api.julyedu.com/app/algorithm/home"

//更多
#define moreURL @"https://api.julyedu.com/app/algorithm/home/more/"

//课程页
#define courseURL @"https://api.julyedu.com/app/algorithm/course/"

//增加用户学习记录  post
#define addCourseRecoder @"https://api.julyedu.com/app/algorithm/addLearnRecord"

//得到用户学习记录
#define getCourseRecoder @"https://api.julyedu.com/app/algorithm/learnRecord"


//退出登录 get
#define logoutURL @"https://api.julyedu.com/app/logout"

//视频播放接口 get
#define playVideoURL(ID) @"https://api.julyedu.com/app/algorithm/play/ID"

//轮播图图片
#define  HeaderImageURL @"https://web.julyedu.com/Public/Image/home/"


//课程图片
#define courseImageURL @"https://web.julyedu.com//Public/Image/"

//视频图片
#define videoURL @"https://web.julyedu.com//Public/Image/"

//教师图片
#define teacherURL @"https://web.julyedu.com/Public/Teacher/"


//获取用户信息
#define getUserInfomation @"https://api.julyedu.com/u/i"








#endif

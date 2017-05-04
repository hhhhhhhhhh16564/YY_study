//
//  JUNotificationConst.h
//  algorithm
//
//  Created by pro on 16/6/27.
//  Copyright © 2016年 Julyonline. All rights reserved.
//
#import <Foundation/Foundation.h>
//下载状态发生改变的通知
extern NSString *const JUDownloadStateDidChangeNotification;
//已经完成下载的通知 (整个mp4文件或m3u8文件以及m3u8文件所包含的.ts文件)
extern NSString *const JuDownloadTaskDidFinishDownloadingNotification;


//m3u8文件已经完成下载的通知(只是m3u8的文本文件
extern NSString *const Jum3u8DownloadTaskDidFinishDownloadingNotification;


//已经删除下载视频的通知
extern NSString *const JUDidDeletedownloadedVides;

//开始播放
extern NSString *const startplayVedioNotification;



//正在播放的视频字体颜色为蓝色，要发送一个通知
extern NSString *const changePlayedVedioNameColorNotification;


//提交学习记录成功的通知，提交成功后，通知学习记录的页面刷新
extern NSString *const addCourseRecorderSucceedNotification;


//登录状态发生变化
extern NSString *const JULoginStatueDidChanged;











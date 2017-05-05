//
//  JUUser.h
//  七月算法_iPad
//
//  Created by pro on 16/5/28.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JuuserInfo [JUUser sharceInstance]

typedef enum {Third_None = -1,Third_WEIXIN,Third_QQ,Third_WEIBO} ThirdType;

@class JUUser;
@protocol JUUserDelegate <NSObject>


-(void)loginStateDidChanged:(JUUser*)juuser;

@end


@interface JUUser : NSObject

{
    NSString *_uid;
}

//uid （可能是两种类型，NSnumber 或者 NSString)
@property (nonatomic, strong) NSString* uid;
@property (nonatomic, strong) NSString* mobile;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString* password;

//头像

//自动登录
//@property (nonatomic, assign) BOOL isAutoLogin;
@property (nonatomic, assign) BOOL isLogin;

//是否进行了注销操作，如果是，则不会自动登录

@property(nonatomic, assign) BOOL isPersonalLogout;


@property (nonatomic, strong) NSString *token;

@property (nonatomic, assign) ThirdType thirdType;


@property(nonatomic, strong)NSMutableDictionary *headDit;


@property(nonatomic, weak)id<JUUserDelegate> userDelegate;


//
//------------------------------------------------------{
//    data = {
//        nickname = 0,
//        uid = 33521,
//        avatar_file = ,
//        group_id = 3,
//        name = 0,
//        w_lear_num = 23,
//        user_name = hhhhhhhhhh1654,
//        access_token = 2bbd148cc478a27c-3b0437f26129bf82
//    },
//    errno = 0
//}

@property(nonatomic, strong) NSString *nickname;
//头像
@property (nonatomic, strong) NSString* avatar_file;

@property(nonatomic, strong) NSString *group_id;

@property(nonatomic, strong) NSString *w_lear_num;

@property (nonatomic, strong) NSString* user_name;
@property(nonatomic, strong) NSString *access_token;

@property(nonatomic, strong) NSString *name;


//@property (nonatomic,assign) NSTimeInterval lastLogoutApp;


+(instancetype)sharceInstance;

-(void)saveUserInfo;
//-(void)clearUserInfo;
-(void)loadFromUserDefaults;

//+ (NSString *)filePathForHeadImg;

@end

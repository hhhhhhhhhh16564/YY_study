//
//  JUUser.m
//  七月算法_iPad
//
//  Created by pro on 16/5/28.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "JUUser.h"



@implementation JUUser


+(instancetype)sharceInstance
{
    
    static dispatch_once_t onceToken;
    static JUUser *user = nil;
    dispatch_once(&onceToken, ^{
       
        user = [[JUUser alloc]init];
        
    });
    
    
    return user;
    
}


-(NSString *)mobile{
    return _mobile?_mobile:@"";
}
-(NSString *)email{
    
    return _email?_email:@"";
}
-(NSString *)user_name{
    return _user_name?_user_name:@"";
}
-(NSString *)password{
    return _password?_password:@"";
}
-(NSString *)avatar_file{
    return _avatar_file?_avatar_file:@"";
}
-(NSString *)accessToken{
    return _accessToken?_accessToken:@"";
}
-(NSString *)uid{
    
 
   
    return _uid;
    
}
-(void)setUid:(NSString *)uid
{
    
    _uid = [NSString stringWithFormat:@"%@",uid];
    
    
}


-(void)setIsLogin:(BOOL)isLogin
{
    BOOL oldState = _isLogin;
    
     _isLogin = isLogin;
    
    
    //老的状态不等于新的状态
    if (oldState != isLogin) {
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:JULoginStatueDidChanged object:nil];

    }
    
    
    
    
    
   
    
//    if ([self.userDelegate respondsToSelector:@selector(loginStateDidChanged:)]) {
//        
//        [self.userDelegate loginStateDidChanged:self];
//        
//    }
    
}


//取得时候先加载
-(void)loadFromUserDefaults{
    //    GMSingleClientUser* user = [[GMSingleClientUser alloc]init];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    _uid = [defaults objectForKey:@"uid"];
    _mobile =[defaults objectForKey:@"mobile"];
    _user_name =[defaults objectForKey:@"user_name"];
    _password =[defaults objectForKey:@"password"];
    _email =[defaults objectForKey:@"email"];
    _avatar_file = [defaults objectForKey:@"avatar_file"];
    _isLogin =[[defaults objectForKey:@"isLogin"] boolValue];
    _accessToken = [defaults objectForKey:@"accessToken"];
    _isPersonalLogout = [[defaults objectForKey:@"isPersonalLogout"] boolValue];
   
    //    return user;
}

-(void)saveUserInfo{
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.uid forKey:@"uid"];
    
    [defaults setObject:self.mobile forKey:@"mobile"];
    [defaults setObject:self.user_name forKey:@"user_name"];
    [defaults setObject:self.password forKey:@"password"];
    [defaults setObject:self.email forKey:@"email"];
    [defaults setObject:self.avatar_file forKey:@"avatar_file"];
    
    NSNumber *isLogin = [NSNumber numberWithBool:self.isLogin];
    [defaults setObject:isLogin forKey:@"isLogin"];
    [defaults setObject:self.accessToken forKey:@"accessToken"];
    
    NSNumber *isPersonalLogout = [NSNumber numberWithBool:self.isPersonalLogout];
    [defaults setObject:isPersonalLogout forKey:@"isPersonalLogout"];
    
    [defaults synchronize];
    
}




-(NSMutableDictionary *)headDit{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
// plat_form 1 //plat_form=1 表示ios plat_form=2 表示android
// client_os [[UIDevice currentDevice] systemVersion]
// device_id [[UIDevice currentDevice].identifierForVendor UUIDString]

    NSString *plat_form = [NSString stringWithFormat:@"%d",1];
    NSString *client_os = [[UIDevice currentDevice] systemVersion];
    NSString *device_id = [[UIDevice currentDevice].identifierForVendor UUIDString];
    
    [dict setObject:plat_form forKey:@"plat-form"];
    [dict setObject:client_os forKey:@"client-os"];
    [dict setObject:device_id forKey:@"device-id"];
    
    
    //登录之后加入 uid
    if (self.isLogin) {
        
        

     [dict setObject:self.uid forKey:@"uid"];
        
        
     [dict setObject:self.accessToken forKey:@"access-token"];
        
    }
    return dict;

    
}



@end

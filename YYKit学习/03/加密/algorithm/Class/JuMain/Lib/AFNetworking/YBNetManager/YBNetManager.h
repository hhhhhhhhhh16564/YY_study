//
//  YBNetManager.h
//  ceshicesih
//
//  Created by lanou3g on 16/4/16.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#define requestManager [[YBNetManager alloc]init]
@interface YBNetManager : NSObject


-(void)canceAllrequest;

-(NSURLSessionDataTask *)GET:(NSString *)URLString
parameters:(id)parameters
  headdict:(NSMutableDictionary *)headDict
  progress:(void (^)(NSProgress * progress))Progress
   success:(void (^)(NSURLSessionDataTask * task , id responobject))success
   failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;


- (NSURLSessionDataTask *)POST:(NSString *)URLString
  parameters:(id)parameters
    headdict:(NSMutableDictionary *)headDict
    progress:(void (^)(NSProgress * progress))Progress
     success:(void (^)(NSURLSessionDataTask * task , id responobject))success
     failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;
//放弃使用单例，因为不方便取消任务
//+(instancetype)sharceInstance;




@end

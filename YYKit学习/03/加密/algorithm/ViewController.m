//
//  ViewController.m
//  algorithm
//
//  Created by pro on 16/6/27.
//  Copyright © 2016年 Julyonline. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "NSData+YYAdd.h"
#include <CommonCrypto/CommonCrypto.h>

@interface ViewController ()
@property(nonatomic, strong) NSString *cachespath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSData *data = [@"111" dataUsingEncoding:NSUTF8StringEncoding];

    
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    
    
    JULog(@"%02x",result[0]);
    
    NSString *str = [NSString stringWithFormat:@"%02x", result[0]];
    
    JULog(@"%@\n\n----------------------", str);
    
    JULog(@"%zd", data.length);
    JULog(@"%zd", data.md5String.length);
    
    
    
    JULog(@"%@", data.md5String);
//
    
    JULog(@"%@", data.md5Data);
    JULog(@"%zd", data.md5Data.length);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)first:(id)sender {
}
- (IBAction)second:(id)sender {
}
- (IBAction)third:(id)sender {
}
- (IBAction)four:(id)sender {
}


-(NSString *)cachespath{
    
    NSString *caches = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    //随便拼接一个东西
    NSString *cachespath = [caches stringByAppendingPathComponent:@"mydatatool23472"];
    return cachespath;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    TableViewController *tab = [[TableViewController alloc]init];
    [self.navigationController pushViewController:tab animated:YES];
    
    
}

























/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ViewController.m
//  algorithm
//
//  Created by pro on 16/6/27.
//  Copyright © 2016年 Julyonline. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "NSObject+YYAddForKVO.h"
#import "Model.h"
@interface ViewController ()
@property(nonatomic, strong) NSString *cachespath;

@property(nonatomic, strong)  Model *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)first:(id)sender {
    
    self.model = [[Model alloc]init];
    
    [self.model addObserverBlockForKeyPath:@"name" block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
        
       
        JULog(@"name1:  %@", oldVal);
        
    }];
    
    
}
- (IBAction)second:(id)sender {
    
    [self.model addObserverBlockForKeyPath:@"name" block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
        
        
        JULog(@"name2:  %@", oldVal);
        
    }];
}
- (IBAction)third:(id)sender {
    
    self.model.name = @"11";
}
- (IBAction)four:(id)sender {
    
    [self addObserverBlockForKeyPath:@"cachespath" block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
        
        
        JULog(@"name3:  %@", oldVal);
        
    }];
    
    
    
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

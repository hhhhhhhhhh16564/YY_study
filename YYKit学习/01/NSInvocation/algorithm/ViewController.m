//
//  ViewController.m
//  algorithm
//
//  Created by pro on 16/6/27.
//  Copyright © 2016年 Julyonline. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "NSObject+YYAdd.h"
@interface ViewController ()
@property(nonatomic, strong) NSString *cachespath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)first:(id)sender {
    
    [self test];
}
- (IBAction)second:(id)sender {
    
    [self text2];
}
- (IBAction)third:(id)sender {
   [self addObject:@"1111", @"2222", @"3", @"好好", @"黑恶化",nil];
    
}


- (IBAction)four:(id)sender {
    
    
}

-(void)tex3{
    NSLog(@"int        : %s", @encode(int));
    NSLog(@"float      : %s", @encode(float));
    NSLog(@"float *    : %s", @encode(float*));
    NSLog(@"char       : %s", @encode(char));
    NSLog(@"char *     : %s", @encode(char *));
    NSLog(@"BOOL       : %s", @encode(BOOL));
    NSLog(@"void       : %s", @encode(void));
    NSLog(@"void *     : %s", @encode(void *));
    NSLog(@"NSObject * : %s", @encode(NSObject *));
    NSLog(@"NSObject   : %s", @encode(NSObject));
    NSLog(@"[NSObject] : %s", @encode(typeof([NSObject class])));
    NSLog(@"NSError ** : %s", @encode(typeof(NSError **)));
    int intArray[5] = {1, 2, 3, 4, 5};
    NSLog(@"int[]      : %s", @encode(typeof(intArray)));
    float floatArray[3] = {0.1f, 0.2f, 0.3f};
    NSLog(@"float[]    : %s", @encode(typeof(floatArray)));
    typedef struct _struct {
        short a;
        long long b;
        unsigned long long c;
    } Struct;
    NSLog(@"struct     : %s", @encode(typeof(Struct)));
    

        // int        : i
        // float      : f
        // float *    : ^f
        // char       : c
        // char *     : *
        // BOOL       : B
        // void       : v
        // void *     : ^v
        // NSObject * : @
        // NSObject   : {NSObject=#}
        // [NSObject] : #
        // NSError ** : ^@
        // int[]      : [5i]
        // float[]    : [3f]
        // struct     : {_struct=sqQ}
        //
    
    /*
    这里有一些特别需要注意的：
    
    指针的标准编码是加一个前置的 ^，而 char * 拥有自己的编码 *。这在概念上是很好理解的，因为 C 的字符串被认为是一个实体，而不是指针。
    BOOL 是 c，而不是某些人以为的 i。原因是 char 比 int 小，且在 80 年代 Objective-C 最开始设计的时候，每一个 bit 位都比今天的要值钱（就像美元一样）。BOOL 更确切地说是 signed char （即使设置了 -funsigned-char 参数），以在不同编译器之间保持一致，因为 char 可以是 signed 或者 unsigned。
    直接传入 NSObject 将产生 #。但是传入 [NSObject class] 产生一个名为 NSObject 只有一个类字段的结构体。很明显，那就是 isa 字段，所有的 NSObject 实例都用它来表示自己的类型。

    */
    

    
}


-(void)addObject:(NSString *)str1, ...{
    NSMutableArray *array = [NSMutableArray array];
    va_list list;
    id tag;
    va_start(list, str1);
    while ((tag = va_arg(list, id))) {
        [array addObject:tag];
    }
    va_end(list);
    
    NSLog(@"%@", array);
    
  // 第一个参数已经传进来，需要手动添加
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


-(void)text2{
    NSString *methodNameStr = @"test:withArg2:andArg3:";
    SEL selector = NSSelectorFromString(methodNameStr);
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    /*NSMethodSignature有两个常用的只读属性
     a. numberOfArguments:方法参数的个数
     b. methodReturnLength:方法返回值类型的长度，大于0表示有返回值
     */
    
   // 2.使用方法的签名来创建一个NSInvocation对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    //只能使用该方法来创建，不能使用alloc init
    
   // 3.给invocation的两个属性赋值
    //要执行谁的（target）的哪个方法（selector）
    invocation.target = self;
    invocation.selector = selector;
    
   // 4.给要执行的方法设置参数
//    设置参数，必须传递参数的地址，不能直接传值
    NSString *arg1 = @"a";
    NSString *arg2 = @"b";
    NSString *arg3 = @"c";
    [invocation setArgument:&arg1 atIndex:2];
    [invocation setArgument:&arg2 atIndex:3];
    [invocation setArgument:&arg3 atIndex:4];
    
    //可以在invoke方法前添加，也可以在invoke方法后添加
    //通过方法签名的methodReturnLength判断是否有返回值

//    5.执行方法
    [invocation invoke];
    
    //获得方法的返回值：注意：返回值必须在方法执行完毕后获得
    id result = nil;
    if (signature.methodReturnLength > 0) {
        [invocation getReturnValue:&result];
        
        const  char *type = [signature methodReturnType];
        
        JULog(@"%s", type);
    }
    JULog(@"%@", result);
   }

- (NSString *)test:(NSString *)arg1 withArg2:(NSString *)arg2 andArg3:(NSString *)arg3 {
    NSLog(@"%@---%@---%@", arg1, arg2, arg3);
    return @"我是返回值哈哈哈";
}

- (void)test {
    int a = 1;
    int b = 2;
    int c = 300;
    int e[4] = {22, 4, 6, 8};
    CGPoint point = CGPointMake(0, 0);
    SEL myMethod = @selector(myLog:param:parm:parm:parm:);
    // 创建一个函数签名，这个签名可以是任意的，但需要注意，签名函数的参数数量要和调用的一致。
    NSMethodSignature *sig = [[self class] instanceMethodSignatureForSelector:myMethod];
    // 通过签名初始化
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    //    2.FirstViewController *view = self;
    //    2.[invocation setArgument:&view atIndex:0];
    //    2.[invocation setArgument:&myMethod2 atIndex:1];
    // 设置target
    //    1.[invocation setTarget:self];
    // 设置selector
    [invocation setSelector:myMethod];
    // 注意：//如果此消息有参数需要传入，那么就需要按照如下方法进行参数设置，需要注意的是，
//    atIndex的下标必须从2开始。原因为：0 1 两个参数已经被target 和selector占用
    int * p = e;
    

    [invocation setArgument:&a atIndex:2];
    [invocation setArgument:&b atIndex:3];
    [invocation setArgument:&c atIndex:4];
    [invocation setArgument:&p atIndex:5];
    [invocation setArgument:&point atIndex:6];
    //   [invocation retainArguments];
    // 我们将c的值设置为返回值
    [invocation setReturnValue:&c];

    NSUInteger argCount = [sig numberOfArguments];
    NSLog(@"argCount:%ld", argCount);

    for (NSInteger i=0; i<argCount; i++) {
        char * type = (char *)[sig getArgumentTypeAtIndex:i];
//        JULog(@"%c", *type);
        JULog(@"%s", type);
    }
    
    /*
     2017-04-26 11:09:43.205 algorithm[20032:110571] @
     2017-04-26 11:09:43.205 algorithm[20032:110571] :
     2017-04-26 11:09:43.206 algorithm[20032:110571] i
     2017-04-26 11:09:43.206 algorithm[20032:110571] i
     2017-04-26 11:09:43.206 algorithm[20032:110571] i
     2017-04-26 11:09:43.206 algorithm[20032:110571] ^i
     2017-04-26 11:09:43.206 algorithm[20032:110571] {CGPoint=dd}

     */
    // i 代表int
    NSLog(@"returnType:%s ,returnLen:%ld", [sig methodReturnType], [sig methodReturnLength]);
//    2017-04-26 11:29:08.782 algorithm[23095:125823] returnType:i ,returnLen:4
    
    NSLog(@"signature:%@" , sig);
    //retain 所有参数，防止参数被释放dealloc
    [invocation retainArguments];
    
    // 消息调用
    [invocation invokeWithTarget:self];
    
    const  char *type = [sig methodReturnType];
    
    JULog(@"返回值类型：%s", type);
}


- (int)myLog:(int)a param:(int)b parm:(int)c parm:(int[])e parm:(CGPoint)point
{
    NSLog(@"MyLog:%d,%d,%d", a, b, c);
    NSLog(@"%d", e[0]);
    NSLog(@"%@", NSStringFromCGPoint(point));
    
//    MyLog:1,2,300
//    2017-04-27 16:59:30.035 algorithm[74728:376196] 22
//    2017-04-27 16:59:30.035 algorithm[74728:376196] {0, 0}
    return a+b+c;
}



-(id)hhh{
    
//    SEL sel = NSSelectorFromString(@"jj");
//    id _return_ = nil;
//    
//
//NSMethodSignature * sig = [self methodSignatureForSelector:sel];
//if (!sig) {
//    [self doesNotRecognizeSelector:sel];
//    return _return_;
//}
//NSInvocation *inv = [NSInvocation invocationWithMethodSignature:sig];
//if (!inv)
//{ [self doesNotRecognizeSelector:sel];
//    return _return_;
//
//}
//[inv setTarget:self];
//[inv setSelector:sel];
//va_list args;
//    NSInteger size = 0;
//    NSInteger _size_ = 1;
    return nil;
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

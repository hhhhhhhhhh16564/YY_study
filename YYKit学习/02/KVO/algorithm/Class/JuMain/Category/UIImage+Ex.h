

#import <UIKit/UIKit.h>

@interface UIImage (Ex)
//图片不渲染
+ (instancetype)originalImage:(NSString *)name;

//根据颜色生成背景图片
+ (UIImage *)imageWithColor:(UIColor *)color;
@end

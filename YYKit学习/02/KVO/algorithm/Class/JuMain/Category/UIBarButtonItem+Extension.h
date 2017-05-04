

#import <UIKit/UIKit.h>


@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;


-(UIBarButtonItem *)itemWithtitlesize:(CGFloat)fontsize color:(UIColor *)titleColor UIBarButonItem:(UIBarButtonItem *)barButtonItem;


@end


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
//- (CGSize)sizeWithFont:(UIFont *)font;

//邮箱的正则表达式
+ (BOOL) validateEmail:(NSString *)email;
+ (BOOL) validatePassword:(NSString *)passWord;

@end

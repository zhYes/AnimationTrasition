//
//
//  Created by 马铃薯 on 2022/1/10.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYQuestionsOneAnimationTrasition : NSObject<UINavigationControllerDelegate>

/** 转场过渡的图片 */
- (void)setTransitionImgView:(UIImageView *)transitionImgView;
/** 转场前的图片frame */
- (void)setTransitionBeforeImgFrame:(CGRect)frame;
/** 转场后的图片frame */
- (void)setTransitionAfterImgFrame:(CGRect)frame;

@end

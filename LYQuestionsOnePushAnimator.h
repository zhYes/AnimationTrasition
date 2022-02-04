//
//
//  Created by 马铃薯 on 2022/1/10.
//

//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYQuestionsOnePushAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIImageView *transitionImgView;

@property (nonatomic, assign) CGRect transitionBeforeImgFrame;  //转场前图片的frame

@property (nonatomic, assign) CGRect transitionAfterImgFrame;   //转场后图片的frame

@end

//
//
//  Created by 马铃薯 on 2022/1/10.
//

//

#import "LYQuestionsOnePushAnimator.h"

@implementation LYQuestionsOnePushAnimator



- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //FromVC
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    [containerView addSubview:fromView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    toView.alpha = 0;
    
    //过渡的图片
    UIImageView *transitionImgView = [[UIImageView alloc] initWithImage:self.transitionImgView.image];
    transitionImgView.frame = self.transitionBeforeImgFrame;
    [transitionContext.containerView addSubview:transitionImgView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
        
        transitionImgView.frame = self.transitionAfterImgFrame;
        
        toView.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        [transitionImgView removeFromSuperview];
        
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:!wasCancelled];
    }];
    
}


- (void)refreshArrow {
    
    if (self.transitionImgView) {
        self.transitionImgView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.transitionImgView.transform = CGAffineTransformMakeRotation(0);
    }
}

@end



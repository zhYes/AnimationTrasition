# AnimationTrasition
iOS 转场动画 push pop


![效果.gif](https://upload-images.jianshu.io/upload_images/1914107-5f7c692a46327f71.gif?imageMogr2/auto-orient/strip)

> # 第0步 : 下载，拖入项目中。


> # 第1步 : 导入头文件

```
#import "LYQuestionsOneAnimationTrasition.h"

///设置属性
@property (nonatomic,strong)LYQuestionsOneAnimationTrasition * animatedTransition;
```


> # 第2步 : 设置代理

```
//1.设置代理
    self.animatedTransition = nil;
    self.navigationController.delegate = self.animatedTransition;
```

> # 第3步 ： 设置参数 完成跳转

```
    GWMCarSourceTableViewCell * cell = (GWMCarSourceTableViewCell *)[self.carListTableView cellForRowAtIndexPath:indexPath];
    CGRect imgFrame = [self getFrameInWindow:cell.carImageView];
    
// 2.传入必要的3个参数 
    [self.animatedTransition setTransitionImgView:cell.carImageView];//过渡动画的imageView
    [self.animatedTransition setTransitionBeforeImgFrame:imgFrame];//过渡之前imageView的frame
    [self.animatedTransition setTransitionAfterImgFrame:CGRectMake(0, 0, k_SCREEN_WIDTH, k_SCREEN_WIDTH * (275.0/375.0))];//过渡之后的imageView的frame

//3.push跳转
    GWMCarDetailBaseViewController * carDetail = [[GWMCarDetailBaseViewController alloc] init];
    [self.navigationController pushViewController:carDetail animated:YES];
```
> 增加一个用到的方法：

```
// 获取imageView在window中的位置
- (CGRect)getFrameInWindow:(UIView *)view
{
    return [view.superview convertRect:view.frame toView:nil];
}

//懒加载
- (LYQuestionsOneAnimationTrasition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYQuestionsOneAnimationTrasition alloc] init];
    }
    return _animatedTransition;
}
```
**  **
**  **
# 以上已经完成了效果
**  **
**  **

> # 美化
```
//1.隐藏目标控制器的图片，延迟转场后再显示
[self performSelector:@selector(delayMethods) withObject:nil afterDelay:0.25];//需要用到转场动画的地方
//2.图片的模式最好设置成 UIViewContentModeScaleAspectFit
[cell.carImageView setContentMode:UIViewContentModeScaleAspectFit];
```
[使用说明](https://www.jianshu.com/p/2b9a241efb2d)
原理讲解参考：[iOS自定义交互式转场动画-仿微信图片转场、酷狗转场 (从零到一 + 交互式图片浏览器)](https://www.jianshu.com/p/ec08f43808aa)


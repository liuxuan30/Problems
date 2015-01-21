//
//  ViewController.m
//  animateTest
//
//  Created by Xuan on 1/20/15.
//  Copyright (c) 2015 wing. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+PDF.h"

@interface ViewController ()
- (IBAction)Show:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *HomeLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *HomeScrollView;
@property (strong, nonatomic) IBOutlet UICollectionView *MyCollectionView;
@property (weak, nonatomic) UIView *UnreadAlertView;
@end

@implementation ViewController {
    NSUInteger unreadCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Show:(id)sender {
    [self showUnreadAlertView];
}

- (void) showUnreadAlertView {
    //release view if any
    if (self.UnreadAlertView)
        [self.UnreadAlertView removeFromSuperview];
    
    //setup view
    CGRect bound = [[UIScreen mainScreen] bounds];
    UIView *AlertView  = [[UIView alloc] initWithFrame:CGRectMake(bound.origin.x + 10,
                                                                  bound.origin.y,
                                                                  bound.size.width - 10,
                                                                  50)];
    //[AlertView setBackgroundColor:[UIColor redColor]];
    
    //setup button
    unreadCount = 6;
    UIButton *btn = [[UIButton alloc] initWithFrame:AlertView.bounds];
    [btn setImage:[UIImage imageWithPDFNamed:@"ico_sidebar_alert" atSize:CGSizeMake(25, 25)] forState:UIControlStateNormal];
    NSString *msg = [NSString stringWithFormat:@"您有%lu条未读预警信息", unreadCount];
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [btn setBackgroundColor:[UIColor redColor]];
    //set edge insets
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    
    UIImage *arrow = [UIImage imageWithPDFNamed:@"ico_arrow_right" atSize:CGSizeMake(25, 25)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(btn.bounds.size.width - 30,
                                                                           btn.bounds.origin.y, 30, 30)];
    [imageView setImage:arrow];
    [btn addSubview:imageView];
    [AlertView addSubview:btn];
    self.UnreadAlertView = AlertView;
    
    
    //试着注释掉下面这行和 animation里的self.UnreadAlertView.alpha = 1.0f;
    //如果不添加这个，动画是预期的。但是如果添加了这个view，动画实际开始的地方被上移了
    [self.HomeScrollView addSubview:AlertView];
    self.UnreadAlertView.alpha = 0.0f;
    
    CGFloat offset = AlertView.bounds.size.height;
    // alert animation frame
    bound = self.UnreadAlertView.frame;
    
    //NSLog(@"sub views:%@", self.HomeScrollView.subviews);
    // home label animate frame
    CGRect labelAnimateBound = self.HomeLabel.frame;
    CGRect homeLabelAnimateFrame = CGRectMake(labelAnimateBound.origin.x,
                                              labelAnimateBound.origin.y + offset,
                                              labelAnimateBound.size.width,
                                              labelAnimateBound.size.height);
    
    // project collection view animation frame
    CGRect projectCollectionBound = self.MyCollectionView.frame;
    CGRect ProjectAnimateFrame = CGRectMake(projectCollectionBound.origin.x,
                                            projectCollectionBound.origin.y + offset,
                                            projectCollectionBound.size.width,
                                            projectCollectionBound.size.height);
    //NSLog(@"content inset %@", self.MyCollectionView.contentInset);

    
    
    [UIView animateWithDuration:1
                     animations:^{
                         NSLog(@"home label y:%f", self.HomeLabel.frame.origin.y);
                         //self.UnreadAlertView.frame = AlertAnimateFrame;
                         self.HomeLabel.frame = homeLabelAnimateFrame;
                         self.MyCollectionView.frame = ProjectAnimateFrame;
                       
                         self.UnreadAlertView.alpha = 1.0f;
                     }completion:^(BOOL finished) {
                         //self.HomeLabel.frame = homeLabelAnimateFrame;
                         //self.MyCollectionView.frame = ProjectAnimateFrame;

                         //self.UnreadAlertView.alpha = 1.0f;
                     }];
}



@end

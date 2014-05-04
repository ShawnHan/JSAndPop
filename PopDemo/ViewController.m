//
//  ViewController.m
//  PopDemo
//
//  Created by Shawn on 14-5-4.
//  Copyright (c) 2014年 hanlong. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>

@interface ViewController ()

@property (nonatomic) BOOL isMenuOpen;

@property (strong, nonatomic) UIView *popUp;

@end

@implementation ViewController
@synthesize myWebView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    _popUp = [[UIView alloc] init];
    _popUp.frame = CGRectMake(10, 30, 200, 200);
    _popUp.backgroundColor= [UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0];
    [self.view addSubview:_popUp];
    
    myWebView.backgroundColor = [UIColor colorWithRed:0.0 green:140.0/255.0 blue:255.0/255.0 alpha:1.0];
    myWebView.scalesPageToFit = YES;
    myWebView.delegate = self;
    
     NSURL *url =[[NSURL alloc] initWithString:@"http://www.google.com.hk/m?gl=CN&hl=zh_CN&source=ihp"];
    
    NSURLRequest *request =  [[NSURLRequest alloc] initWithURL:url];
    [myWebView loadRequest:request];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    //NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    //NSString *js_result = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('q')[0].value='朱祁林';"];
    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function myFunction() { "
     "var field = document.getElementsByName('q')[0];"
     "field.value='github';"
     "document.forms[0].submit();"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)hidePopup
{
    //_isMenuOpen = NO;
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.fromValue = @(1);
    opacityAnimation.toValue = @(0);
    [_popUp.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(10+200, 30+200)];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(10+100, 30+100)];
    [_popUp.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    
    scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
    scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(0.5f, 0.5f)];
    [_popUp.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

- (void)showPopup
{
    //_isMenuOpen = YES;
    
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.fromValue = @(0);
    opacityAnimation.toValue = @(1);
    opacityAnimation.beginTime = CACurrentMediaTime() + 0.1;
    [_popUp.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(10+100, 30+100)];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(10+100+100, 30+100+100)];
    [_popUp.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5f)];
    scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];//@(0.0f);
    scaleAnimation.springBounciness = 20.0f;
    scaleAnimation.springSpeed = 20.0f;
    [_popUp.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}
- (IBAction)popAction:(id)sender {
    [self hidePopup];
}

- (IBAction)podUPcome:(id)sender {
    [self showPopup];
}
@end

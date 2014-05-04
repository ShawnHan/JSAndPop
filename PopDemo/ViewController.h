//
//  ViewController.h
//  PopDemo
//
//  Created by Shawn on 14-5-4.
//  Copyright (c) 2014年 hanlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
- (IBAction)popAction:(id)sender;
- (IBAction)podUPcome:(id)sender;

@end

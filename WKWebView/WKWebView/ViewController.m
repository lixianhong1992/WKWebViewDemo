//
//  ViewController.m
//  WKWebView
//
//  Created by 李献红 on 16/5/31.
//  Copyright © 2016年 李献红. All rights reserved.
//

#import "ViewController.h"
#import "UIWebViewC.h"
#import "WKWebViewC.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)pushToUIWeb:(id)sender {
    UIWebViewC *VC = [[UIWebViewC alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];
    [self presentViewController:nav animated:YES completion:nil];
}
- (IBAction)pushToWK:(id)sender {
        NSLog(@"YES");
        WKWebViewC *VC = [[WKWebViewC alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];
        [self presentViewController:nav animated:YES completion:nil];
}
//- (IBAction)pushToWKWeb:(id)sender {
//    
//    NSLog(@"YES");
//    WKWebViewC *VC = [[WKWebViewC alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];
//    [self presentViewController:nav animated:YES completion:nil];
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  UIWebViewC.m
//  WKWebView
//
//  Created by 李献红 on 16/5/31.
//  Copyright © 2016年 李献红. All rights reserved.
//

#import "UIWebViewC.h"

@interface UIWebViewC ()

@property (nonatomic, weak)  UIWebView *webView;
@end
@implementation UIWebViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIWebView";
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.view addSubview:webView];
    [webView loadRequest:request];
    self.webView = webView;
    
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton)];
    self.navigationItem.leftBarButtonItem = rightButton;
    
}

- (void)clickRightButton {

    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
     [self.webView stopLoading];
    self.webView = nil;
}
- (void)dealloc
{
    [self.webView stopLoading];
    self.webView = nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

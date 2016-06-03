//
//  WKWebViewC.m
//  WKWebView
//
//  Created by 李献红 on 16/5/31.
//  Copyright © 2016年 李献红. All rights reserved.
//

#import "WKWebViewC.h"
#import <WebKit/WebKit.h>
@interface WKWebViewC ()<WKNavigationDelegate>
@property (nonatomic, weak) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation WKWebViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 70, 375, 600)];
    [self.view addSubview:webView];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.view addSubview:webView];
    [webView loadRequest:request];
    webView.navigationDelegate = self;
//webView.estimatedProgress
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    [webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    self.webView = webView;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton)];
    self.navigationItem.leftBarButtonItem = rightButton;

    self.progressView = [[UIProgressView alloc]initWithProgressViewStyle:0];

    self.progressView.frame = CGRectMake(0, 63, self.view.frame.size.width, 10);
//    self.progressView.backgroundColor = [UIColor whiteColor];
    [self.navigationController.view addSubview:self.progressView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        if (object == _webView) {
            [self.progressView setAlpha:1.0f];
            [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
            NSLog(@"%f",self.webView.estimatedProgress);
            if(self.webView.estimatedProgress == 1.0f) {
                
                [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [self.progressView setAlpha:0.0f];
                } completion:^(BOOL finished) {
                    [self.progressView setProgress:0.0f animated:NO];
                }];
                
            }
        }
        else
        {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
        
    }
    else if ([keyPath isEqualToString:@"title"])
    {
        if (object == self.webView) {
            self.title = self.webView.title;
            
        }
        else
        {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
            
        }
    }
    else {
        
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{

    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [_webView removeObserver:self forKeyPath:@"title"];
}

- (void)clickRightButton {

    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  JDLViewController.m
//  JDLRouter
//
//  Created by zhengzhenxing on 01/14/2020.
//  Copyright (c) 2020 zhengzhenxing. All rights reserved.
//

#import "JDLViewController.h"
#import "JDLRouter.h"
#import "NSURLComponents+JDLRouter.h"
@interface JDLViewController ()

@end

@implementation JDLViewController
- (IBAction)pushAction:(id)sender {
    JDLRouter *router = [[JDLRouter alloc] init];

    [router gotoPage:@"http://jd.com?ktestPatchTriger=2"
        failure:^(NSError *_Nonnull error) {
            NSLog(@"跳转失败：%@", error);
        }
        sucess:^{
            NSLog(@"跳转成功");
        }
        callback:^(id _Nonnull data){

        }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

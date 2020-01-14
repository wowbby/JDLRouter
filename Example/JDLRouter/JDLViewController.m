//
//  JDLViewController.m
//  JDLRouter
//
//  Created by zhengzhenxing on 01/14/2020.
//  Copyright (c) 2020 zhengzhenxing. All rights reserved.
//

#import "JDLViewController.h"
#import "NSURLComponents+JDLRouter.h"
#import "JDLRouter.h"
@interface JDLViewController ()

@end

@implementation JDLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURLComponents * com1 = [NSURLComponents componentsWithString:@"http://jd.com?a=1&b=2"];
    NSURLComponents * com2 = [NSURLComponents componentsWithString:@"http://jd.com?a=3&b=4"];
    
    [com1 mergeQuery:com2];
    
    JDLRouter * router = [[JDLRouter alloc]init];
    
    [router gotoPage:@"http://jd.com?a=1&b=2&ktestPatchTriger=1" failure:^(NSError * _Nonnull error) {
        
    } sucess:^{
        
    } callback:^(id  _Nonnull data) {
        
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

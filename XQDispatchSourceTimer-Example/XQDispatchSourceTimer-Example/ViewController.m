//
//  ViewController.m
//  XQDispatchSourceTimer-Example
//
//  Created by pinba on 2020/11/10.
//  Copyright © 2020 pinba. All rights reserved.
//

#import "ViewController.h"
#import "XQDispatchSourceTimer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XQDispatchSourceTimer *timer = [[XQDispatchSourceTimer alloc] init];
    [timer dispatchSourceTimer:30 handle:^(NSUInteger progress){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%zd",progress);
            
        });
    } interval:1.];
}


@end

//
//  ViewController.m
//  RunloopDemo
//
//  Created by Lol on 2018/3/8.
//  Copyright © 2018年 Lol. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self runLoopTest];
}


- (void)timerFire {
    NSLog(@"mode:%@",[[NSRunLoop currentRunLoop] currentMode]);
}

- (void)runLoopTest {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSTimer *tickTimer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:2 target:self selector:@selector(modeTestTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timerFire forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode  beforeDate:[NSDate distantFuture]];
    });
}


@end

//
//  ViewController.m
//  OCOJ
//
//  Created by Xuan on 3/2/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

#import "ViewController.h"
#import "OCOJ-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Solution *solution = [[Solution alloc] init];
    [solution addDigits:32];
}

@end

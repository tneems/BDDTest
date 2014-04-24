//
//  ViewController.m
//  BDDTest
//
//  Created by Timothy Neems on 4/24/14.
//  Copyright (c) 2014 Timothy Neems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.meaningOfLife.text = @"";
    [self.meaningOfLife addObserver:self forKeyPath:@"text" options:0 context:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    self.meaningOfLife.text = @"42";
    self.coolButton.enabled = NO;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isEqual:self.meaningOfLife] && [keyPath isEqualToString:@"text"]) {
        if ([self.meaningOfLife.text isEqualToString:@""]) {
            return;
        }
        [UIView animateWithDuration:1.0 animations:^{
            self.meaningOfLife.alpha = 0.0;
        } completion:^(BOOL finished) {
            self.meaningOfLife.text = @"";
            self.meaningOfLife.alpha = 1.0;
            self.coolButton.enabled = YES;
        }];
    }
}


@end

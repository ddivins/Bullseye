//
//  RootViewController.m
//  BullsEye
//
//  Created by David S. Divins on 2/20/2013.
//  Copyright (c) 2013 David S. Divins. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotate
{
    //NSLog(@"should auto rotate is called....");
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    //NSLog(@"supportedInterfaceOrientationssupportedInterfaceOrientations ");
    return  UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return  APP_ORIENTATION(toInterfaceOrientation);
}



@end

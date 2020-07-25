//
//  SplashScreenController.m
//  BullsEye
//
//  Created by David S. Divins on 2/20/2013.
//  Copyright (c) 2013 David S. Divins. All rights reserved.
//

#import "SplashScreenController.h"
#import "HomeScreenController.h"

@interface SplashScreenController ()

@end

@implementation SplashScreenController

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
    
    
    NSString *bgName = nil;
    if(SCREEN_HEIGHT==568)
        bgName = @"Default-568h@2x.png";
    else
        bgName = @"Default.png";
    
    
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:50];
    imageView.image = [UIImage imageNamed:bgName];
    
    
    [self performSelector:@selector(goToMenuScreen) withObject:nil afterDelay:2];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)goToMenuScreen
{
    HomeScreenController *home = [[HomeScreenController alloc] initWithNibName:@"HomeScreenController" bundle:nil];
    [self.navigationController pushViewController:home animated:YES];
    [home release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

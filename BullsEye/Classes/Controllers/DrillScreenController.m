//
//  DrillScreenController.m
//  BullsEye
//
//  Created by David S. Divins on 2/20/2013.
//  Copyright (c) 2013 David S. Divins. All rights reserved.
//

#import "HomeScreenController.h"
#import "InfoScreenController.h"
#import "DrillScreenController.h"
#import "SoundScreenController.h"

@interface DrillScreenController ()

@end

@implementation DrillScreenController

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
        bgName = @"homebg_iPhone5.png";
    else
        bgName = @"homebg.png";
        
    
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:50];
    imageView.image = [UIImage imageNamed:bgName];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)drill1Pressed:(id)sender
{
    SoundScreenController *mSoundScreen = [[SoundScreenController alloc]initWithNibName:@"SoundScreenController" bundle:nil];
    mSoundScreen.mType = @"drill1";
    [self.navigationController pushViewController:mSoundScreen animated:YES];
    [mSoundScreen release];
}

-(IBAction)drill2Pressed:(id)sender
{
    SoundScreenController *mSoundScreen = [[SoundScreenController alloc]initWithNibName:@"SoundScreenController" bundle:nil];
    mSoundScreen.mType = @"drill2";
    [self.navigationController pushViewController:mSoundScreen animated:YES];
    [mSoundScreen release];
    
}

-(IBAction)drill3Pressed:(id)sender
{
    SoundScreenController *mSoundScreen = [[SoundScreenController alloc]initWithNibName:@"SoundScreenController" bundle:nil];
    mSoundScreen.mType = @"drill3";
    [self.navigationController pushViewController:mSoundScreen animated:YES];
    [mSoundScreen release];
    
}

-(IBAction)drill4Pressed:(id)sender
{
    SoundScreenController *mSoundScreen = [[SoundScreenController alloc]initWithNibName:@"SoundScreenController" bundle:nil];
    mSoundScreen.mType = @"drill4";
    [self.navigationController pushViewController:mSoundScreen animated:YES];
    [mSoundScreen release];
    
}

-(IBAction)drill5Pressed:(id)sender
{
    SoundScreenController *mSoundScreen = [[SoundScreenController alloc]initWithNibName:@"SoundScreenController" bundle:nil];
    mSoundScreen.mType = @"drill5";
    [self.navigationController pushViewController:mSoundScreen animated:YES];
    [mSoundScreen release];
    
}

-(IBAction)slow5Pressed:(id)sender
{
    SoundScreenController *mSoundScreen = [[SoundScreenController alloc]initWithNibName:@"SoundScreenController" bundle:nil];
    mSoundScreen.mType = @"slow5";
    [self.navigationController pushViewController:mSoundScreen animated:YES];
    [mSoundScreen release];
    
}

-(IBAction)goToHome:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)dealloc
{
    
    [super dealloc];
}



@end

//
//  InfoScreenController.h
//  BullsEye
//
//  Created by David S. Divins on 3/16/13.
//  Copyright (c) 2013 David S. Divins. All rights reserved.
//

#import "InfoScreenController.h"

@interface InfoScreenController ()

@end

@implementation InfoScreenController
@synthesize quote;

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

    //quote.text = [NSString stringWithFormat:@"Bullseye Range Commands\nDavid S. Divins\n\nSupport: fatboy47@gmail.com\n\nVersion %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    NSString *string1 = @"Bullseye Range Commands\nDavid S. Divins\n\nSupport: fatboy47@gmail.com\n\nVersion ";
    NSString *string2 =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *string3 = @" Build ";
    NSString *string4 =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];

    quote.text = [NSString stringWithFormat:@"%@%@%@%@", string1, string2, string3, string4];
    
    // Do any additional setup after loading the view from its nib.
}


#pragma mark -
#pragma mark BUTTON ACTIONS -------


-(IBAction)goToHome:(id)sender
{
        [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

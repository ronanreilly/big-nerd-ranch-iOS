//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Ronan Sean Reilly on 10/05/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        // Tab bar items title
        self.tabBarItem.title = @"Hypnosis";
        
        // UI image for Tab
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // Place image on tab bar
        self.tabBarItem.image = i;
    }
    
    return self;

}

// Overriding this method to see when the veiw is finshed loading, this should be the first view loaded as it is first in the tab bar controller's array.
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}


// Overriding loadView
-(void)loadView
{
    // create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // set it as the view of this controller
    self.view = backgroundView;
}

@end

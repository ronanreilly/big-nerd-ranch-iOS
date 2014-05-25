//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Ronan Sean Reilly on 10/05/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisView ()

@end

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
        
        // Create a segmented control with 3 items
        UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:(NSArray *)@[@"Red", @"Green", @"Blue"]];
        // Make and position a rect
        sc.frame = CGRectMake(35, 200, 250, 50);
        // Default selection
        sc.selectedSegmentIndex = 0;
        // set background color
        sc.backgroundColor = [UIColor lightGrayColor];
        // set target, selector
        [sc addTarget:self
               action:@selector(changeColor:)
     forControlEvents:UIControlEventValueChanged];
     [self.view addSubview:sc];
    }
    
    return self;

}

// This method handles the UISegmented controls touch events
-(void)changeColor:(id)sender{
    // reference to UISegmentedContol
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSLog(@"The Segment control was touched %ld", (long)segmentedControl.selectedSegmentIndex);
    // Checking each of our segments for a touch and changing color of concentric circle colors
    if (segmentedControl.selectedSegmentIndex == 0) {
        ((BNRHypnosisView *)self.view).circleColor = [UIColor redColor];
    }
    if (segmentedControl.selectedSegmentIndex == 1) {
        ((BNRHypnosisView *)self.view).circleColor = [UIColor greenColor];
    }
    if (segmentedControl.selectedSegmentIndex == 2) {
        ((BNRHypnosisView *)self.view).circleColor = [UIColor blueColor];
    }
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

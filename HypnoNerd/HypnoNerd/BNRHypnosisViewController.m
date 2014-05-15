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


// Overriding loadView
-(void)loadView{
    // create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // set it as the view of this controller
    self.view = backgroundView;
}

@end

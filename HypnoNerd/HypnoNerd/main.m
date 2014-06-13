//
//  main.m
//  HypnoNerd
//
//  Created by Ronan Sean Reilly on 10/05/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNRAppDelegate.h"

int main(int argc, char * argv[])
{   // Responsible for maintaining the Run Loop. Executing thread will never retrun to main.
    // The last argument here is string. This is the class anme for the app's delegate. In this case BNRAppDelegate.
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([BNRAppDelegate class]));
    }
}

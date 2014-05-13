//
//  main.m
//  RondomItems
//
//  Created by Ronan Sean Reilly on 19/03/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // create mutable array
        NSMutableArray * items = [[NSMutableArray alloc] init];
        
        // add items to array
        /*[items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        // add another item at 0
        [items insertObject:@"Zero" atIndex:0];
        
        // iterate over array using fast enumeration
        for (NSString *item in items) {
            NSLog(@"%@", item);
        }
        
        // Use designated Initialiser
        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Yellow Sofa" valueInDollars:100 serialNumber:@"23rgHHa"];
        
        BNRItem *itemWithName = [[BNRItem alloc] initwithItemName:@"Orange Sofa"];
        
        BNRItem *itemWithNoName = [[BNRItem alloc] init];
        
        BNRItem *item = [[BNRItem alloc] init];
        //[item setItemName:@"Red Sofa"];
        //[item setSerialNumber:@"A22BND"];
        //[item setValueInDollars:100];
        item.itemName = @"Red Sofa";
        item.serialNumber = @"A22BND";
        item.valueInDollars = 100;*/
        
        /*NSLog(@" %@ %@ %@ %d", [item itemName], [item dateCreated], [item serialNumber], [item valueInDollars]);*/
        /*NSLog(@" %@ %@ %@ %d", item.itemName, item.serialNumber, item.dateCreated, item.valueInDollars);*/
        //NSLog(@"ITEM USING DESIGNATED INITIALISER: %@", item);
        //NSLog(@"ITEM USING DESIGNATED INITIALISER: %@", itemWithName);
        //NSLog(@"ITEM USING DESIGNATED INITIALISER: %@", itemWithNoName);*/
        
        // Create an array of random items
        for (int i =0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        // cause runtime error
        //id lastObj = [items lastObject];
        // last object is an instance of BNRItem and will not understand the count message
        //[lastObj count];
        
        
        // BRONZE CHALLEGNE, OUT OF BOUND ERROR
        /*id outOfBoundsOBJ = [items objectAtIndex:11];
        // last object is an instance of BNRItem and will not understand the count message
        //[lastObj count];
        NSLog(@"%@", outOfBoundsOBJ);*/
        
        
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        // destroy mutable array
        items = nil;
    }
    return 0;
}


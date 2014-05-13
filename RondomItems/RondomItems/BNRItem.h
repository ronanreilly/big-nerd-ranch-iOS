//
//  BNRItem.h
//  RondomItems
//
//  Created by Ronan Sean Reilly on 19/03/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

+(instancetype)randomItem;

-(void)setItemName:(NSString *)str;
-(NSString *)itemName;

-(void)setSerialNumber:(NSString *)str;
-(NSString *)serialNumber;

-(void)setValueInDollars:(int)v;
-(int)valueInDollars;

-(NSDate *)dateCreated;

// Designated Initialiser for BNRItem
-(instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;

-(instancetype)initwithItemName:(NSString *)name;

@end

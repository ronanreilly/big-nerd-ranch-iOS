//
//  BNRItem.m
//  RondomItems
//
//  Created by Ronan Sean Reilly on 19/03/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

-(instancetype)initWithItemName:(NSString *)name
                 valueInDollars:(int)value
                   serialNumber:(NSString *)sNumber
{
    // call super classes's designated initialiser
    self = [super init];
    
    // did super classes designated initialiser suceed
    if (self) {
        // give instance variables initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        // set date created to current dat & time
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;

}

-(instancetype)initwithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

-(instancetype)init{
    return [self initwithItemName:@"Item"];
}

+(instancetype)randomItem{
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // get index of random adjective/noun from lists
    // teh % operato, called modulator gives remainder.
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // NSInt is not object but type definition for long
    /*NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];*/
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex],
                                                                randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    'O' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    'O' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    'O' + arc4random() % 10];
    
    // NB: Note use self here so that if we subclass this class we can create objects using random item, this would not be the case if we use the class name.
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                   valueInDollars:randomValue
                                     serialNumber:randomSerialNumber];
    
    return newItem;
    
}

-(void)setItemName:(NSString *)str
{
    _itemName = str;
}

-(NSString *)itemName
{
    return _itemName;
}

-(void)setSerialNumber:(NSString *)str
{
    _itemName = str;
}

-(NSString *)serialNumber
{
    return _itemName;
}

-(void)setValueInDollars:(int)v
{
    _valueInDollars = v;
}

-(int)valueInDollars
{
    return _valueInDollars;
}

-(NSDate *)dateCreated
{
    return _dateCreated;
}

-(NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    
    return descriptionString;
}



@end

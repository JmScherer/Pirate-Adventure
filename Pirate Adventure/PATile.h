//
//  PATile.h
//  Pirate Adventure
//
//  Created by James Scherer on 10/30/13.
//  Copyright (c) 2013 Vandelay Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAArmor.h"
#import "PAWeapon.h"

@interface PATile : NSObject

@property (strong, nonatomic) NSString *tileTitle;
@property (strong, nonatomic) NSString *tileStory;
@property (strong, nonatomic) UIImage *tileImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) PAWeapon *weapon;
@property (strong, nonatomic) PAArmor *armor;
@property (nonatomic) int healthEffect;

@end

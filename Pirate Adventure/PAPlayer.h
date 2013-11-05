//
//  PAPlayer.h
//  Pirate Adventure
//
//  Created by James Scherer on 10/31/13.
//  Copyright (c) 2013 Vandelay Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAArmor.h"
#import "PAWeapon.h"

@interface PAPlayer : NSObject

@property (nonatomic) int playerHealth;
@property (nonatomic, strong) PAArmor *armor;
@property (nonatomic, strong) PAWeapon *weapon;

@end

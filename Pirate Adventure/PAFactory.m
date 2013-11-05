//
//  PAFactory.m
//  Pirate Adventure
//
//  Created by James Scherer on 10/30/13.
//  Copyright (c) 2013 Vandelay Industries. All rights reserved.
//

#import "PAFactory.h"

@implementation PAFactory

-(NSMutableArray *)tileGameBoard{
    
    PATile *tilePirateAttack = [[PATile alloc] init];
    tilePirateAttack.tileTitle = @"Pirate Attack!";
    tilePirateAttack.tileStory = @"You have sailed upon a pirate battle! You must fight!";
    tilePirateAttack.tileImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tilePirateAttack.actionButtonName = @"Fight back!";
    tilePirateAttack.healthEffect = -20;
    
    
    PATile *tilePirateBlacksmith = [[PATile alloc] init];
    tilePirateBlacksmith.tileTitle = @"Pirate Blacksmith";
    tilePirateBlacksmith.tileStory = @"Upon taking another pirate ship, you order the captive blacksmith to forge you a new weapon.";
    tilePirateBlacksmith.tileImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    PAWeapon *weaponCutlass = [[PAWeapon alloc] init];
    weaponCutlass.weaponName = @"Cutlass";
    weaponCutlass.damage = 15;
    tilePirateBlacksmith.weapon = weaponCutlass;
    tilePirateBlacksmith.actionButtonName = @"Take the Cutlass";
    
    PATile *tilePirateBoss = [[PATile alloc] init];
    tilePirateBoss.tileTitle = @"Pirate Boss";
    tilePirateBoss.tileStory = @"The fearsome pirate boss! Give him all you've got!";
    tilePirateBoss.tileImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tilePirateBoss.actionButtonName = @"Attack Pirate Boss";
    
    PATile *tilePirateFriendlyDock = [[PATile alloc] init];
    tilePirateFriendlyDock.tileTitle = @"Pirate Dock";
    tilePirateFriendlyDock.tileStory = @"You've come across a friendly pirate dock. Do your men a favor and replenish their rum supplies!";
    tilePirateFriendlyDock.tileImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tilePirateFriendlyDock.actionButtonName = @"Rest at the port";
    
    NSMutableArray *rowTiles1 = [[NSMutableArray alloc] initWithObjects:tilePirateAttack, tilePirateBlacksmith, tilePirateBoss, tilePirateFriendlyDock, nil];
    [self shuffle:rowTiles1];
    
    PATile *tilePirateOctopusAttack = [[PATile alloc] init];
    tilePirateOctopusAttack.tileTitle = @"The Mighty Kraken";
    tilePirateOctopusAttack.tileStory = @"From the deep appears the mighty Kraken! Despair!";
    tilePirateOctopusAttack.tileImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tilePirateOctopusAttack.actionButtonName = @"Face the Kraken";
    tilePirateOctopusAttack.healthEffect = -35;
    
    PATile *tilePirateParrot = [[PATile alloc] init];
    tilePirateParrot.tileTitle = @"Parrot";
    tilePirateParrot.tileStory = @"You've come across the ever vocal parrot. Do you risk madness in donning him on your shoulder?";
    tilePirateParrot.tileImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tilePirateParrot.actionButtonName = @"Equip Parrot";
    
    PATile *tilePiratePlank = [[PATile alloc] init];
    tilePiratePlank.tileTitle = @"Walk the plank";
    tilePiratePlank.tileStory = @"You've been apprehanded by a rival crew! You are forced to walk the plank! Luckily you can swim.";
    tilePiratePlank.tileImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tilePiratePlank.actionButtonName = @"Take a swim";
    tilePiratePlank.healthEffect = -15;
    
    PATile *tilePirateShipBattle = [[PATile alloc] init];
    tilePirateShipBattle.tileTitle = @"Ship Battle";
    tilePirateShipBattle.tileStory = @"Ahoy! Raise the flag! Batten down the hatches! Load the canons! Full steam ahead!";
    tilePirateShipBattle.tileImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tilePirateShipBattle.actionButtonName = @"Join the brawl";
    tilePirateShipBattle.healthEffect = 20;
    
    NSMutableArray *rowTiles2 = [[NSMutableArray alloc] initWithObjects:tilePirateOctopusAttack, tilePirateParrot, tilePiratePlank, tilePirateShipBattle, nil];
    
    PATile *tilePirateStart = [[PATile alloc] init];
    tilePirateStart.tileTitle = @"Adventure Start";
    tilePirateStart.tileStory = @"You've begun your pirate adventure! You're a little green, but that won't stop you from taking out the mighty Pirate Boss! Careful on your journey!";
    tilePirateStart.tileImage = [UIImage imageNamed:@"PirateStart.jpg"];
    
    PATile *tilePirateTreasure = [[PATile alloc] init];
    tilePirateTreasure.tileTitle = @"Pirate Treasure";
    tilePirateTreasure.tileStory = @"You've come across some delicious pirate booty! Take what's yours!";
    tilePirateTreasure.tileImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tilePirateTreasure.actionButtonName = @"Equip Steel Armor";
    PAArmor *armorSteelBreastPlate = [[PAArmor alloc] init];
    armorSteelBreastPlate.armorName = @"Steel Breast Plate";
    armorSteelBreastPlate.defense = 15;
    tilePirateTreasure.armor = armorSteelBreastPlate;
    
    PATile *tilePirateTreasure2 = [[PATile alloc] init];
    tilePirateTreasure2.tileTitle = @"Pirate Treasure Cove";
    tilePirateTreasure2.tileStory = @"You've stumbled upon a hidden pirate cove filled with treasure! What are you waiting for? Give the word to loot and plunder!";
    tilePirateTreasure2.tileImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tilePirateTreasure2.actionButtonName = @"Loot and Plunder";
    tilePirateTreasure2.healthEffect = 35;
    
    PATile *tilePirateWeapons = [[PATile alloc] init];
    tilePirateWeapons.tileTitle = @"Cache of Pirate Weapons";
    tilePirateWeapons.tileStory = @"Upon going to the weapon's store on your ship, you've discovered a pistol sitting by it's lonesome. How did that happen? You're the captain, take what's yours!";
    tilePirateWeapons.tileImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tilePirateWeapons.actionButtonName = @"Take Pistol";
    PAWeapon *weaponPistol = [[PAWeapon alloc] init];
    weaponPistol.weaponName = @"Pirate Pistol";
    weaponPistol.damage = 20;
    tilePirateWeapons.weapon = weaponPistol;
    
    NSMutableArray *rowTiles3 = [[NSMutableArray alloc] initWithObjects:tilePirateStart, tilePirateTreasure, tilePirateTreasure2, tilePirateWeapons, nil];
    [self shuffle:rowTiles3];
    
    NSMutableArray *tileGameBoard = [[NSMutableArray alloc] initWithObjects:rowTiles1, rowTiles2, rowTiles3, nil];
    [self shuffle:tileGameBoard];
    
    
    return tileGameBoard;
}

-(void)shuffle:(NSMutableArray *)shuffleBoardTiles{
    
    NSUInteger count = [shuffleBoardTiles count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = arc4random_uniform(nElements) + i;
        [shuffleBoardTiles exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

-(PAPlayer *) Player{
    PAPlayer *player = [[PAPlayer alloc] init];
    player.playerHealth = 50;
    
    PAArmor *armor = [[PAArmor alloc] init];
    armor.armorName = @"Pirate Shirt";
    armor.defense = 1;
    
    player.armor = armor;
    
    PAWeapon *weapon = [[PAWeapon alloc] init];
    weapon.weaponName = @"Hook";
    weapon.damage = 1;
    
    player.weapon = weapon;
    
    return player;
}


-(PABoss *) Boss{
    PABoss *Boss = [[PABoss alloc] init];
    Boss.bossHealth = 500;
//    int lowerBound = 10;
//    int upperBound = 35;
//    Boss.bossDamage = lowerBound + arc4random() % (upperBound - lowerBound);
    Boss.bossDamage = 35;
    
    return Boss;
}


@end

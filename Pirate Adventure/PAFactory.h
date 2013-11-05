//
//  PAFactory.h
//  Pirate Adventure
//
//  Created by James Scherer on 10/30/13.
//  Copyright (c) 2013 Vandelay Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PATile.h"
#import "PAPlayer.h"
#import "PABoss.h"

@interface PAFactory : NSObject

-(NSMutableArray *)tileGameBoard;
-(void)shuffle:(NSMutableArray *)shuffleBoardTiles;
-(PAPlayer *) Player;
-(PABoss *) Boss;

@end

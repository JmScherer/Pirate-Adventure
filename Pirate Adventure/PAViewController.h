//
//  PAViewController.h
//  Pirate Adventure
//
//  Created by James Scherer on 10/30/13.
//  Copyright (c) 2013 Vandelay Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Toast+UIView.h"
#import "PAFactory.h"

@interface PAViewController : UIViewController


@property (strong, nonatomic) NSMutableArray *tileGameBoard;
@property (nonatomic) CGPoint currentPoint;
@property (nonatomic) CGPoint startPoint;
@property (strong, nonatomic) NSArray *tileAllTiles;
@property (strong, nonatomic) PAPlayer *characterPlayer;
@property (strong, nonatomic) PABoss *characterBoss;

@property (strong, nonatomic) IBOutlet UIView *panelTile;
@property (strong, nonatomic) IBOutlet UIView *panelCharacter;

@property (strong, nonatomic) IBOutlet UILabel *labelCharacterHealth;
@property (strong, nonatomic) IBOutlet UILabel *labelCharacterWeapon;
@property (strong, nonatomic) IBOutlet UILabel *labelCharacterArmor;
@property (strong, nonatomic) IBOutlet UILabel *labelCharacterDamage;
@property (strong, nonatomic) IBOutlet UILabel *labelTileStory;
@property (strong, nonatomic) IBOutlet UIButton *labelNorth;
@property (strong, nonatomic) IBOutlet UIButton *labelEast;
@property (strong, nonatomic) IBOutlet UIButton *labelSouth;
@property (strong, nonatomic) IBOutlet UIButton *labelWest;
@property (strong, nonatomic) IBOutlet UIButton *labelActionButton;
@property (strong, nonatomic) IBOutlet UILabel *labelBossHealth;
@property (strong, nonatomic) IBOutlet UILabel *labelBossDamage;


@property (strong, nonatomic) IBOutlet UIImageView *tile1;
@property (strong, nonatomic) IBOutlet UIImageView *tile2;
@property (strong, nonatomic) IBOutlet UIImageView *tile3;
@property (strong, nonatomic) IBOutlet UIImageView *tile4;
@property (strong, nonatomic) IBOutlet UIImageView *tile5;
@property (strong, nonatomic) IBOutlet UIImageView *tile6;
@property (strong, nonatomic) IBOutlet UIImageView *tile7;
@property (strong, nonatomic) IBOutlet UIImageView *tile8;
@property (strong, nonatomic) IBOutlet UIImageView *tile9;
@property (strong, nonatomic) IBOutlet UIImageView *tile10;
@property (strong, nonatomic) IBOutlet UIImageView *tile11;
@property (strong, nonatomic) IBOutlet UIImageView *tile12;
@property (strong, nonatomic) IBOutlet UILabel *tileStory;



- (IBAction)buttonCharacterPanel:(UIButton *)sender;
- (IBAction)buttonTilePanel:(UIButton *)sender;
- (IBAction)buttonNorth:(UIButton *)sender;
- (IBAction)buttonEast:(UIButton *)sender;
- (IBAction)buttonSouth:(UIButton *)sender;
- (IBAction)buttonWest:(UIButton *)sender;
- (IBAction)actionButton:(UIButton *)sender;
- (IBAction)resetButton:(UIButton *)sender;



-(void)updateInventory;
-(void)updateTile;
-(void)updateButtons;
-(NSArray *)updateStartTile;

@end

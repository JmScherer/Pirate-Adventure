//
//  PAViewController.m
//  Pirate Adventure
//
//  Created by James Scherer on 10/30/13.
//  Copyright (c) 2013 Vandelay Industries. All rights reserved.
//

#import "PAViewController.h"

@interface PAViewController ()

@end

@implementation PAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PAFactory *factory = [[PAFactory alloc] init];
    
    self.tileGameBoard = [factory tileGameBoard];
    self.characterPlayer = [factory Player];
    self.characterBoss = [factory Boss];
    self.startPoint = CGPointMake(0, 0);
	NSLog(@"Beginning: %f %f", self.startPoint.x, self.startPoint.y);
    NSLog(@"%i", self.characterPlayer.playerHealth);
    NSLog(@"%i", self.characterPlayer.weapon.damage);
    NSLog(@"%@", self.characterPlayer.weapon.weaponName);
    
    [self updateCharacterStatusarmor:nil playerWeapons:nil healthStatus:0];
    [self updateInventory];
    [self updateStartTile];
    self.tileAllTiles = [self updateStartTile];
    NSLog(@"After Method Start Point: %f %f", self.startPoint.x, self.startPoint.y);
    NSLog(@"After Method: %f %f", self.currentPoint.x, self.currentPoint.y);
    self.currentPoint = self.startPoint;
    [self updateButtons];
    NSLog(@"After Assigning: %f %f", self.currentPoint.x, self.currentPoint.y);
    [self updateTile];
    NSLog(@"After Update Tile: %f %f", self.currentPoint.x, self.currentPoint.y);
    NSLog(@"%@", self.tileAllTiles);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(void)updateTile{
    PATile *currentTile = [[self.tileGameBoard objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    UIImageView *firstTileImage = [[self.tileAllTiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    UIImage *secondImage = currentTile.tileImage;
    self.labelTileStory.text = [NSString stringWithFormat:@"%@", currentTile.tileTitle];
    self.tileStory.text = [NSString stringWithFormat:@"%@", currentTile.tileStory];
    [self.labelActionButton setTitle:currentTile.actionButtonName forState:UIControlStateNormal];
    [UIView transitionWithView:firstTileImage duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{firstTileImage.image =secondImage;} completion:nil];
        NSLog(@"within update tile: %f %f", self.currentPoint.x, self.currentPoint.y);
}

-(void)updateInventory{
    self.labelCharacterHealth.text = [NSString stringWithFormat:@"%i", self.characterPlayer.playerHealth];
    self.labelCharacterDamage.text = [NSString stringWithFormat:@"%i", self.characterPlayer.weapon.damage];
    self.labelCharacterArmor.text = self.characterPlayer.armor.armorName;
    self.labelCharacterWeapon.text = self.characterPlayer.weapon.weaponName;
    self.labelBossDamage.text = [NSString stringWithFormat:@"%i", self.characterBoss.bossDamage];
    self.labelBossHealth.text = [NSString stringWithFormat:@"%i", self.characterBoss.bossHealth];
}

-(void)updateButtons{
    self.labelWest.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y )];
    self.labelEast.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.labelNorth.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.labelSouth.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];

}

-(BOOL)tileExistsAtPoint:(CGPoint)point{
    
    if(point.y >= 0 && point.x >= 0 && point.x < [self.tileGameBoard count] && point.y < [[self.tileGameBoard objectAtIndex:point.x] count]){
        return NO;
    }
    else {
        return YES;
    }
}

-(NSArray *)updateStartTile{
    
    NSArray *tileRow1 = [[NSArray alloc] initWithObjects:self.tile1, self.tile2, self.tile3, self.tile4, nil];
    NSArray *tileRow2 = [[NSArray alloc] initWithObjects:self.tile5, self.tile6, self.tile7, self.tile8, nil];
    NSArray *tileRow3 = [[NSArray alloc] initWithObjects:self.tile9, self.tile10, self.tile11, self.tile12, nil];
    NSArray *tileAllTiles = [[NSArray alloc] initWithObjects:tileRow1, tileRow2, tileRow3, nil];
    
    for(int x = 0; x < [self.tileGameBoard count]; x++){
        for(int y = 0; y < 4; y++){
            CGPoint startSearch = CGPointMake(x, y);
            PATile *startTile = [[self.tileGameBoard objectAtIndex:startSearch.x] objectAtIndex:startSearch.y];
            ((UIImageView *) [[tileAllTiles objectAtIndex:x] objectAtIndex:y]).image = [UIImage imageNamed:@"BlankTile.jpg"];
            NSLog(@"%f %f %@",startSearch.x, startSearch.y, startTile.tileTitle);
            if([startTile.tileTitle  isEqual: @"Adventure Start"]){
                self.startPoint = startSearch;
                ((UIImageView *) [[tileAllTiles objectAtIndex:x] objectAtIndex:y]).image = startTile.tileImage;
                NSLog(@"Inside Method: %f %f", self.startPoint.x, self.startPoint.y);
            }
        }
    }
    return tileAllTiles;
}

- (IBAction)buttonCharacterPanel:(UIButton *)sender {
    if(self.panelCharacter.hidden == YES)
    {self.panelCharacter.hidden = NO;}
    else{self.panelCharacter.hidden = YES;}
    if(self.panelTile.hidden == NO)
    {self.panelTile.hidden = YES;}
    
}

- (IBAction)buttonTilePanel:(UIButton *)sender {
    
    if(self.panelTile.hidden == YES)
    {self.panelTile.hidden = NO;}
    else{self.panelTile.hidden = YES;}
    if(self.panelCharacter.hidden == NO)
    {self.panelCharacter.hidden = YES;}
    
}

- (IBAction)buttonNorth:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)buttonEast:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}
- (IBAction)buttonSouth:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)buttonWest:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

-(void)updateCharacterStatusarmor:(PAArmor *)armor playerWeapons:(PAWeapon *)weapon healthStatus:(int)healthEffect{
    if(armor != nil){
    self.characterPlayer.armor = armor;
        [self.view makeToast:@"Upgraded Armor"];
        [self.view makeToast:[NSString stringWithFormat:@"Equipped: %@", self.characterPlayer.armor.armorName]];
        
    }
    else if (weapon!= nil) {
        self.characterPlayer.weapon = weapon;
        [self.view makeToast:[NSString stringWithFormat:@"Equipped: %@", self.characterPlayer.weapon.weaponName]];
    }
    else if(healthEffect != 0){
        if (healthEffect > 0){
        self.characterPlayer.playerHealth = self.characterPlayer.playerHealth + healthEffect;
        [self.view makeToast:[NSString stringWithFormat:@"+ %i HP", healthEffect]];
        }
        if (healthEffect < 0){
            self.characterPlayer.playerHealth = self.characterPlayer.playerHealth + healthEffect;
            [self.view makeToast:[NSString stringWithFormat:@"%i HP", healthEffect]];
        }
    }
}

- (IBAction)actionButton:(UIButton *)sender {
    PATile *tile = [[self.tileGameBoard objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    [self updateCharacterStatusarmor:tile.armor playerWeapons:tile.weapon healthStatus:tile.healthEffect];
    [self updateInventory];
    if([tile.tileTitle isEqualToString:@"Pirate Boss"]){
        self.characterBoss.bossHealth = self.characterBoss.bossHealth - self.characterPlayer.weapon.damage;
        self.characterPlayer.playerHealth = self.characterPlayer.playerHealth - self.characterBoss.bossDamage;
        
    }
    if(self.characterBoss.bossHealth <= 0){
        UIAlertView *bossAlert = [[UIAlertView alloc] initWithTitle:@"Boss Defeated!" message:@"Congratulations! You've defeated the Pirate Boss! You are now king of the high seas!" delegate:nil cancelButtonTitle:@"Yay!" otherButtonTitles: nil];
        [bossAlert show];
    }
    else if(self.characterPlayer.playerHealth <= 0){
        UIAlertView *playerAlert = [[UIAlertView alloc] initWithTitle:@"You Died!" message:@"You were defeated prematurely in your quest! You should start over!" delegate:nil cancelButtonTitle:@"Yargh Matey!" otherButtonTitles:nil];
        [playerAlert show];
    }
    [self updateInventory];
    [self updateTile];
}

- (IBAction)resetButton:(UIButton *)sender {
    self.characterPlayer = nil;
    self.characterBoss = nil;
    
    [self viewDidLoad];
    
}


@end

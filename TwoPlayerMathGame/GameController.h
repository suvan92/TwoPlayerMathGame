//
//  GameController.h
//  TwoPlayerMathGame
//
//  Created by Suvan Ramani on 2016-11-07.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameController : NSObject

@property (nonatomic) Player *player1;
@property (nonatomic) Player *player2;
@property (nonatomic) Player *activePlayer;

-(NSString *)changeActivePlayer;
-(NSString *)generateQuestion;
-(BOOL)evaluateAnswer:(NSString *)userAnswer;
-(BOOL)didSomeoneWin;

@end

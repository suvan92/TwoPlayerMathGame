//
//  GameController.m
//  TwoPlayerMathGame
//
//  Created by Suvan Ramani on 2016-11-07.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _player1 = [[Player alloc] initWithName:@"Player 1"];
        _player2 = [[Player alloc] initWithName:@"Player 2"];
    }
    return self;
}


-(NSString *)changeActivePlayer {
    if (self.activePlayer == nil) {
        self.activePlayer = self.player1;
        return self.activePlayer.name;
    } else if (self.activePlayer == self.player1) {
        self.activePlayer = self.player2;
        return self.activePlayer.name;
    } else if (self.activePlayer == self.player2) {
        self.activePlayer = self.player1;
        return self.activePlayer.name;
    } else {
        return nil;
    }
}


-(int)randomNumber {
    int lowerBound = 1;
    int upperBound = 20;
    
    int rndNum = lowerBound + arc4random() % (upperBound - lowerBound);
    
    return rndNum;
}


-(NSString *)generateQuestion {
    
    int number1 = [self randomNumber];
    int number2 = [self randomNumber];
    int answerInt = number1 + number2;
    
    self.answerString = [NSString stringWithFormat:@"%d", answerInt];
    self.currentQuestion = [NSString stringWithFormat:@"%d + %d?", number1, number2];
    
    return self.currentQuestion;
}

-(BOOL)evaluateAnswer:(NSString *)userAnswer{
    
    if ([userAnswer isEqualToString:self.answerString]) {
        return YES;
        
    } else {
        self.activePlayer.livesRemaining -= 1;
        return NO;
    }
}





@end

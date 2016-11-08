//
//  Player.m
//  TwoPlayerMathGame
//
//  Created by Suvan Ramani on 2016-11-07.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "Player.h"

@interface Player()

@property (nonatomic) NSString *playerAnswer;
@property (nonatomic) BOOL lostGame;

@end

@implementation Player

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _livesRemaining = 3;
        _playerAnswer = @"";
        _lostGame = NO;
        _name = name;
    }
    return self;
}

@end

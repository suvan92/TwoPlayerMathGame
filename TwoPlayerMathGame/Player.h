//
//  Player.h
//  TwoPlayerMathGame
//
//  Created by Suvan Ramani on 2016-11-07.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) NSString *name;
@property (assign) int livesRemaining;

-(instancetype)initWithName:(NSString *)name;

@end

//
//  ViewController.m
//  TwoPlayerMathGame
//
//  Created by Suvan Ramani on 2016-11-07.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"
#import "GameController.h"
#import "Player.h"

@interface ViewController ()

@property (nonatomic, strong) GameController *gameController;

@property (weak, nonatomic) IBOutlet UILabel *activePlayerLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerAnswerLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightWrongLabel;
@property (weak, nonatomic) IBOutlet UILabel *winningLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _playerAnswerLabel.text = [[NSMutableString alloc] init];
    _gameController = [[GameController alloc] init];
    self.activePlayerLabel.text = [self.gameController changeActivePlayer];
    _questionLabel.text = [self.gameController generateQuestion];
    _rightWrongLabel.text = @"";
    _winningLabel.text = @"";
}

- (IBAction)enterButton:(UIButton *)sender {
    
    BOOL questionCheck = [self.gameController evaluateAnswer:self.playerAnswerLabel.text];
    self.playerAnswerLabel.text = @"";
    
    if (questionCheck) {
        self.rightWrongLabel.textColor = [UIColor greenColor];
        self.rightWrongLabel.text = @"Correct!";
        self.questionLabel.text = [self.gameController generateQuestion];
        self.activePlayerLabel.text = [self.gameController changeActivePlayer];
        
    } else {
        self.rightWrongLabel.textColor = [UIColor redColor];
        self.rightWrongLabel.text = @"Wrong!";
        
        // Update lives remaining
        if (self.gameController.activePlayer == self.gameController.player1) {
            self.player1ScoreLabel.text = [NSString stringWithFormat:@"%@ Lives Remaining: %d", self.gameController.activePlayer.name, self.gameController.activePlayer.livesRemaining];
        } else {
            self.player2ScoreLabel.text = [NSString stringWithFormat:@"%@ Lives Remaining: %d", self.gameController.activePlayer.name, self.gameController.activePlayer.livesRemaining];
        }
        
        self.questionLabel.text = [self.gameController generateQuestion];
        self.activePlayerLabel.text = [self.gameController changeActivePlayer];
    }
    
    
    if ([self.gameController didSomeoneWin]) {
        if (self.gameController.player1.livesRemaining == 0) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GAME OVER" message:@"Player 2 Wins!!!" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *replay = [UIAlertAction actionWithTitle:@"Would you like to play again?" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                self.gameController = [[GameController alloc] init];
                self.activePlayerLabel.text = [self.gameController changeActivePlayer];
                self.playerAnswerLabel.text = @"";
                self.player1ScoreLabel.text = [NSString stringWithFormat:@"Player 1 Lives Remaining: %d", self.gameController.player1.livesRemaining];
                self.player2ScoreLabel.text = [NSString stringWithFormat:@"Player 2 Lives Remaining: %d", self.gameController.player2.livesRemaining];
                self.rightWrongLabel.text = @"";
                [alert dismissViewControllerAnimated:YES completion:nil];
            }];
            [alert addAction:replay];
            [self presentViewController:alert animated:YES completion:nil];
            
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GAME OVER" message:@"Player 1 Wins!!!" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *replay = [UIAlertAction actionWithTitle:@"Would you like to play again?" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                self.gameController = [[GameController alloc] init];
                self.activePlayerLabel.text = [self.gameController changeActivePlayer];
                self.playerAnswerLabel.text = @"";
                self.player1ScoreLabel.text = [NSString stringWithFormat:@"Player 1 Lives Remaining: %d", self.gameController.player1.livesRemaining];
                self.player2ScoreLabel.text = [NSString stringWithFormat:@"Player 2 Lives Remaining: %d", self.gameController.player2.livesRemaining];
                self.rightWrongLabel.text = @"";
                [alert dismissViewControllerAnimated:YES completion:nil];
            }];
            [alert addAction:replay];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    }
    
}

- (IBAction)deleteButton:(UIButton *)sender {
    NSString *currentAnswer = self.playerAnswerLabel.text;
    self.playerAnswerLabel.text = [currentAnswer substringToIndex:currentAnswer.length-(currentAnswer.length>0)];
}

- (IBAction)numberZeroButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"0"];
}

- (IBAction)numberOneButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"1"];
}

- (IBAction)numberTwoButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"2"];
}

- (IBAction)numberThreeButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"3"];
}

- (IBAction)numberFourButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"4"];
}

- (IBAction)numberFiveButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"5"];
}

- (IBAction)numberSixButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"6"];
}

- (IBAction)numberSevenButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"7"];
}

- (IBAction)numberEightButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"8"];
}

- (IBAction)numberNineButton:(UIButton *)sender {
    self.playerAnswerLabel.text = [self.playerAnswerLabel.text stringByAppendingString:@"9"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

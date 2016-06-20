//
//  ViewController.h
//  talker
//
//  Created by xiachao on 14-10-14.
//  Copyright (c) 2014年 成都富顿科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *encoderView;
@property (weak, nonatomic) IBOutlet UIView *decoderView;

- (IBAction)startClick:(UIButton *)sender;
- (IBAction)stopClick:(UIButton *)sender;
- (IBAction)startStream:(id)sender;
- (IBAction)stopStream:(UIButton *)sender;
- (IBAction)openVideo:(UIButton *)sender;
- (IBAction)closeVideo:(UIButton *)sender;
- (IBAction)openAudio:(UIButton *)sender;
- (IBAction)sendCoordinate:(id)sender;
- (IBAction)closeAudio:(UIButton *)sender;

@end

        
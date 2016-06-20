//
//  ViewController.m
//  talker
//
//  Created by xiachao on 14-10-14.
//  Copyright (c) 2014年 成都富顿科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import <ftcodec/FTVideoTalker.h>
#import "SettingsViewController.h"
#import "TalkerSetting.h"
#import "AppDelegate.h"
@interface ViewController ()<SettingsViewControllerDelegate>{
    FTVideoTalker * _talker;
    NSString *_ip;
    int _port;
    __weak IBOutlet UIButton *_btnSetting;
}

@end


@implementation ViewController



- (IBAction)start:(id)sender {
}
- (IBAction)onStart:(id)sender {
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _talker = [[FTVideoTalker alloc]init];
        _talker.isFront = YES;
        _talker.debug = YES;

    }
    return self;
}

- (IBAction)test:(id)sender {
}

-(void) updataSetting{
    TalkerSetting * setting =[TalkerSetting instance];
    
    
    _talker.width = setting.width;
    _talker.height = setting.height;
    _talker.frameRate = setting.frameRate;
    _talker.videoBitrate = setting.videoBitRate;
    
    
    _talker.sampleRate = setting.sampleRate;
    _talker.channels = setting.channels;
    _talker.audioBitrate = setting.audioBitRate;
    
    _ip=setting.ip;
    _port = setting.port;
}
- (IBAction)open:(id)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    version = [version stringByAppendingString:@"."];
    version = [version stringByAppendingString:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    [_btnSetting setTitle:[@"setting1 " stringByAppendingString:version] forState:UIControlStateNormal];
    
    
    [[TalkerSetting instance] load];
    [self updataSetting];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lifeCycle:) name:@"lifeCycle" object:nil];
}


- (void)lifeCycle:(NSNotification *)note {
    NSLog(@"lifeCycle%@",(NSString*)note.object);
    if([@"applicationWillResignActive" isEqualToString:(NSString*)note.object]){
        [_talker closeVideo ];
    }
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startClick:(UIButton *)sender {
    [_talker openVideo:_encoderView
encoderViewOrientation:[[UIApplication sharedApplication] statusBarOrientation]
           decoderView:_decoderView];
    [_talker openAudio:YES];
    
    [_talker startUdpStream:_ip port:_port ];
}

- (IBAction)stopClick:(UIButton *)sender {
    [_talker stopStream];
    [_talker closeVideo];
    [_talker closeAudio];
}

- (IBAction)startStream:(id)sender {
    [_talker startUdpStream:_ip port:_port ];
}

- (IBAction)stopStream:(UIButton *)sender {
    [_talker stopStream];

}



- (IBAction)openVideo:(UIButton *)sender {
    [_talker openVideo:_encoderView
encoderViewOrientation:[[UIApplication sharedApplication] statusBarOrientation]
           decoderView:_decoderView];
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [appDelegate yourParam];
}

- (IBAction)closeVideo:(UIButton *)sender {
    [_talker closeVideo];

}

- (IBAction)openAudio:(UIButton *)sender {
    [_talker openAudio:YES];

}

- (IBAction)sendCoordinate:(id)sender {
}

- (IBAction)closeAudio:(UIButton *)sender {
    [_talker closeAudio];
}
- (IBAction)openSpeaker:(id)sender {
    [_talker openSpeaker];
}

- (IBAction)closeSpeaker:(id)sender {
    [_talker closeSpeaker];

}


- (IBAction)settingClick:(id)sender {
    
    SettingsViewController *setVC=[[SettingsViewController alloc]initWithNibName:@"SettingsViewController" bundle:nil];
    setVC.delegate = self;
    [self presentViewController:setVC animated:YES completion:^{}];
    
}

-(void)onSave{
    [self updataSetting];
}
@end

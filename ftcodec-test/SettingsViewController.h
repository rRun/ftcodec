//
//  SettingsViewController.h
//  Talkback
//
//  Created by xiachao on 15/6/8.
//
//

#import <UIKit/UIKit.h>

@protocol SettingsViewControllerDelegate <NSObject>

-(void) onSave;
@end

@interface SettingsViewController : UIViewController

@property  (nonatomic,weak) id<SettingsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *txtWidth;
@property (weak, nonatomic) IBOutlet UITextField *txtHeight;
@property (weak, nonatomic) IBOutlet UITextField *txtFrameRate;
@property (weak, nonatomic) IBOutlet UITextField *txtVideoBitRate;
@property (weak, nonatomic) IBOutlet UITextField *txtSampleRate;
@property (weak, nonatomic) IBOutlet UITextField *txtChannels;
@property (weak, nonatomic) IBOutlet UITextField *txtAudioBitRate;
@property (weak, nonatomic) IBOutlet UITextField *txtIp;
@property (weak, nonatomic) IBOutlet UITextField *txtPort;

@end

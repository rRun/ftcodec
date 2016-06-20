//
//  SettingsViewController.m
//  Talkback
//
//  Created by xiachao on 15/6/8.
//
//

#import "SettingsViewController.h"
#import "TalkerSetting.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController


-(void)setInt:(UITextField*) txt value:(int) value{
    txt.text = [NSString stringWithFormat:@"%d",value];
}

-(int)getInt:(UITextField*) txt {
    if(txt.text.length<=0)
        return 0;
    
    return [txt.text intValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    TalkerSetting * setting =[TalkerSetting instance];
    [self setInt:_txtWidth value:setting.width];
    [self setInt:_txtHeight value:setting.height];
    [self setInt:_txtFrameRate value:setting.frameRate];
    [self setInt:_txtVideoBitRate value:setting.videoBitRate];
    [self setInt:_txtSampleRate value:setting.sampleRate];
    [self setInt:_txtChannels value:setting.channels];
    [self setInt:_txtAudioBitRate value:setting.audioBitRate];
    _txtIp.text = setting.ip;
    [self setInt:_txtPort value:setting.port];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [_txtWidth resignFirstResponder];
    [_txtHeight resignFirstResponder];
    [_txtFrameRate resignFirstResponder];
    [_txtVideoBitRate resignFirstResponder];
    [_txtSampleRate resignFirstResponder];
    [_txtChannels resignFirstResponder];
    [_txtAudioBitRate resignFirstResponder];
    [_txtIp resignFirstResponder];
    [_txtPort resignFirstResponder];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)save:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    TalkerSetting * setting =[TalkerSetting instance];

    setting.width = [self getInt:_txtWidth];
    setting.height = [self getInt:_txtHeight];
    setting.frameRate = [self getInt:_txtFrameRate];
    setting.videoBitRate = [self getInt:_txtVideoBitRate];
    setting.sampleRate = [self getInt:_txtSampleRate];
    setting.channels = [self getInt:_txtChannels];
    setting.audioBitRate = [self getInt:_txtAudioBitRate];
    
    setting.ip =_txtIp.text;
    setting.port = [self getInt:_txtPort];


    
    
    [[TalkerSetting instance] save];
    [_delegate onSave];
}

@end

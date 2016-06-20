//
//  TalkerSetting.m
//  Talkback
//
//  Created by xiachao on 15/6/10.
//
//

#import "TalkerSetting.h"
@implementation TalkerSetting


+(TalkerSetting *)instance{
    static TalkerSetting *_instance=nil;
    @synchronized(self){
        if(_instance==nil)
            _instance =[[TalkerSetting alloc] init];
    }
    
    return _instance;
}


-(void)load{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    _width = (int)[ud integerForKey:@"_width"];
    _height = (int)[ud integerForKey:@"_height"];
    _frameRate = (int)[ud integerForKey:@"_frameRate"];
    _videoBitRate = (int)[ud integerForKey:@"_videoBitRate"];
    
    _sampleRate = (int)[ud integerForKey:@"_sampleRate"];
    _channels = (int)[ud integerForKey:@"_channels"];
    _audioBitRate = (int)[ud integerForKey:@"_audioBitRate"];
    
    _ip = [ud stringForKey:@"_ip"];
    _port = (int)[ud integerForKey:@"_port"];
    
    if(_frameRate==0)
        _frameRate = 15;
    if(_sampleRate==0)
        _sampleRate = 16000;
    if(_channels==0)
        _channels = 1;
    if(_ip.length<=0)
        _ip=@"172.20.2.229";
    if(_port==0)
        _port = 35004;
    
}

-(void)save{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:_width forKey:@"_width"];
    [ud setInteger:_height forKey:@"_height"];
    [ud setInteger:_frameRate forKey:@"_frameRate"];
    [ud setInteger:_videoBitRate forKey:@"_videoBitRate"];
    
    [ud setInteger:_sampleRate forKey:@"_sampleRate"];
    [ud setInteger:_channels forKey:@"_channels"];
    [ud setInteger:_audioBitRate forKey:@"_audioBitRate"];
    
    [ud setObject:_ip forKey:@"_ip"];
    [ud setInteger:_width forKey:@"_width"];

    [ud synchronize];
    
}


@end

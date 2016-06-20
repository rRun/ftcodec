//
//  TalkerSetting.h
//  Talkback
//
//  Created by xiachao on 15/6/10.
//
//

#import <Foundation/Foundation.h>

@interface TalkerSetting : NSObject

+(TalkerSetting*) instance;

@property(nonatomic) int width ;
@property(nonatomic)  int height ;
@property(nonatomic)  int frameRate;
@property(nonatomic)  int videoBitRate;

@property(nonatomic) int sampleRate ;
@property(nonatomic) int channels;
@property(nonatomic) int audioBitRate;


@property(nonatomic) NSString* ip;
@property(nonatomic) int port;

-(void) load;
-(void) save;

@end

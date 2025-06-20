#import <UIKit/UIKit.h>
#import <Cordova/CDV.h>

@interface RecordingDetector : CDVPlugin
- (void)isRecording:(CDVInvokedUrlCommand*)command;
@end

@implementation RecordingDetector

- (void)isRecording:(CDVInvokedUrlCommand*)command {
    BOOL isCaptured = NO;
    if (@available(iOS 11.0, *)) {
        isCaptured = [UIScreen mainScreen].isCaptured;
    }

    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isCaptured];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
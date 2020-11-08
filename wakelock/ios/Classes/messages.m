// Autogenerated from Pigeon (v0.1.14), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "messages.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary* wrapResult(NSDictionary *result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = [NSDictionary dictionaryWithObjectsAndKeys:
        (error.code ? error.code : [NSNull null]), @"code",
        (error.message ? error.message : [NSNull null]), @"message",
        (error.details ? error.details : [NSNull null]), @"details",
        nil];
  }
  return [NSDictionary dictionaryWithObjectsAndKeys:
      (result ? result : [NSNull null]), @"result",
      errorDict, @"error",
      nil];
}

@interface FLTToggleMessage ()
+(FLTToggleMessage*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end
@interface FLTIsEnabledMessage ()
+(FLTIsEnabledMessage*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end

@implementation FLTToggleMessage
+(FLTToggleMessage*)fromMap:(NSDictionary*)dict {
  FLTToggleMessage* result = [[FLTToggleMessage alloc] init];
  result.enable = dict[@"enable"];
  if ((NSNull *)result.enable == [NSNull null]) {
    result.enable = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.enable ? self.enable : [NSNull null]), @"enable", nil];
}
@end

@implementation FLTIsEnabledMessage
+(FLTIsEnabledMessage*)fromMap:(NSDictionary*)dict {
  FLTIsEnabledMessage* result = [[FLTIsEnabledMessage alloc] init];
  result.enabled = dict[@"enabled"];
  if ((NSNull *)result.enabled == [NSNull null]) {
    result.enabled = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.enabled ? self.enabled : [NSNull null]), @"enabled", nil];
}
@end

void FLTWakelockApiSetup(id<FlutterBinaryMessenger> binaryMessenger, id<FLTWakelockApi> api) {
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.WakelockApi.toggle"
        binaryMessenger:binaryMessenger];
    if (api) {
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        FLTToggleMessage *input = [FLTToggleMessage fromMap:message];
        [api toggle:input error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.WakelockApi.isEnabled"
        binaryMessenger:binaryMessenger];
    if (api) {
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        FLTIsEnabledMessage *output = [api isEnabled:&error];
        callback(wrapResult([output toMap], error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
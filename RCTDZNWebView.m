#import "RCTDZNWebView.h"

@implementation RCTDZNWebView

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(openURLWithParams:(NSString*)urlString params:(NSDictionary *)params) {
  NSURL *url = [NSURL URLWithString:urlString];

  id showLoadingProgress  = [params objectForKey:@"showLoadingProgress"];
  id allowHistory         = [params objectForKey:@"allowHistory"];
  id hideBarsWithGestures = [params objectForKey:@"hideBarsWithGestures"];

  DZNWebViewController   *WebViewController    = [[DZNWebViewController alloc] initWithURL:url];
  UIViewController       *rootViewController   = [[UIApplication sharedApplication] keyWindow].rootViewController;
  UINavigationController *NavigationController = [[UINavigationController alloc] initWithRootViewController:WebViewController];

  WebViewController.supportedWebNavigationTools = DZNWebNavigationToolAll;
  WebViewController.supportedWebActions         = DZNWebActionAll;

  WebViewController.showLoadingProgress  = showLoadingProgress  ? [showLoadingProgress  boolValue] : true;
  WebViewController.allowHistory         = allowHistory         ? [allowHistory         boolValue] : true;
  WebViewController.hideBarsWithGestures = hideBarsWithGestures ? [hideBarsWithGestures boolValue] : true;

  dispatch_async(dispatch_get_main_queue(), ^{
    [rootViewController presentViewController:NavigationController animated: YES completion:NULL];
  });
}

@end

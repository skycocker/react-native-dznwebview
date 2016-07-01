#import "RCTDZNWebView.h"

@implementation RCTDZNWebView

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(openURLWithParams:(NSString*)urlString params:(NSDictionary *)params) {
  NSURL *url = [NSURL URLWithString:urlString];
  
  DZNWebViewController   *WebViewController    = [[DZNWebViewController alloc] initWithURL:url];
  UIViewController       *rootViewController   = [[UIApplication sharedApplication] keyWindow].rootViewController;
  UINavigationController *NavigationController = [[UINavigationController alloc] initWithRootViewController:WebViewController];
  
  WebViewController.supportedWebNavigationTools = DZNWebNavigationToolAll;
  WebViewController.supportedWebActions         = DZNWebActionAll;
  WebViewController.showLoadingProgress  = YES;
  WebViewController.allowHistory         = YES;
  WebViewController.hideBarsWithGestures = YES;
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [rootViewController presentViewController:NavigationController animated: YES completion:NULL];
  });
}

@end
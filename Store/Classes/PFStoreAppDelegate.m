//
//  PFAppDelegate.m
//  Stripe
//
//  Created by Andrew Wang on 2/25/13.
//  Copyright (c) 2013 Parse Inc. All rights reserved.
//

#import "PFProductsViewController.h"
#import "PFStoreAppDelegate.h"

@implementation PFStoreAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //[Parse setApplicationId:infoDictionary[@"PARSE_APPLICATION_ID"] clientKey:infoDictionary[@"PARSE_CLIENT_KEY"]];
    ParseClientConfiguration *configuration = [ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration>  _Nonnull configuration) {
        [configuration setApplicationId:infoDictionary[@"PARSE_APPLICATION_ID"]];
        [configuration setClientKey:infoDictionary[@"PARSE_CLIENT_KEY"]];
        [configuration setServer:@"http://localhost:1337/parse"];
    }];
    [Parse initializeWithConfiguration:configuration];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UINavigationController *rootController = [[UINavigationController alloc] initWithRootViewController:[[PFProductsViewController alloc] init]];
    rootController.navigationBar.hidden = YES;
    self.window.rootViewController = rootController;
    
    return YES;
}

@end

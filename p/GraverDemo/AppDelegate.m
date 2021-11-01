//
//  AppDelegate.m
//  GraverDemo
//
//  Created by yangyang on 2018/11/29.
//

#import "AppDelegate.h"
#import "ExamplesViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ExamplesViewController *examplesViewController = [[ExamplesViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:examplesViewController];
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}


@end



/*
 
 1， 实现异步渲染
 
 
 2， 事件调度
 
 3， 数据分发， MVVM
 
 
 */

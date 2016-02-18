//
//  AppDelegate.m
//  AZPersianCalendar
//
//  Created by Ali on 2/16/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import "AppDelegate.h"
#import "AZPersianCalendar.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"SandBox is Here : %@",[self documentsPath]);
    
    [self copyPlistIfNeeded];
    
    
   
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(NSString *)getPlistPath
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory=[paths objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"MySetting.plist"];
    
    
    
}

-(void)copyPlistIfNeeded
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    NSString *dbPath=[self getPlistPath];
    BOOL success=[fileManager fileExistsAtPath:[self getPlistPath]];
    
    
    
    if (!success) {
        // copy file in document directory
        
        NSString *defaultdbPath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"MySetting.plist"];
        
        NSError *error=nil;
        success=[fileManager copyItemAtPath:defaultdbPath toPath:dbPath error:&error];
        if (!success) {
            NSLog(@"can not copy in new path");
        }
        
    }
    
    
}

-(NSString *) documentsPath {
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir=[paths objectAtIndex:0];
    return documentsDir;
    
}


@end

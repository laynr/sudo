//
//  sudoAppDelegate.m
//  sudo
//
//  Created by me on 1/15/11.
//  Copyright 2011 Scoutic LLC. All rights reserved.
//

#import "sudoAppDelegate.h"

@implementation sudoAppDelegate


@synthesize window, goURL;

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url 
{
    // Do something with the url here
	self.goURL = url;
	NSLog(@"url string: %@", [url absoluteString]);
	NSLog(@"url recieved: %@", url);
    NSLog(@"query string: %@", [url query]);
    NSLog(@"host: %@", [url host]);
    NSLog(@"url path: %@", [url path]);
    
	
	
	
	if ([[[url absoluteString] substringWithRange:NSMakeRange(0, 5)] isEqualToString:@"s:cal"]) {
		
        //calendar
        NSString *command = [NSString stringWithFormat:@"http://www.google.com/calendar/event?ctext=+%@+&action=TEMPLATE&pprop=HowCreated%3AQUICKADD", [[[url absoluteString] substringFromIndex:6] stringByReplacingOccurrencesOfString:@"/" withString:@"%20"]];
        NSLog(@"Command: %@", command);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:command]];
        
	} else if ([[[url absoluteString] substringWithRange:NSMakeRange(0, 6)] isEqualToString:@"s:maps"]) {
        
        //maps
        NSString *command = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", [[[url absoluteString] substringFromIndex:7] stringByReplacingOccurrencesOfString:@"/" withString:@"%20"]];
        NSLog(@"Command: %@", command);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:command]];
        
	} else if ([[[url absoluteString] substringWithRange:NSMakeRange(0, 7)] isEqualToString:@"s:email"]) {
        
        //mail
        NSString *command = [NSString stringWithFormat:@"mailto:?&body=%@", [[url absoluteString] substringFromIndex:8]];
        NSLog(@"Command: %@", command);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:command]];
        
	} else if ([[[url absoluteString] substringWithRange:NSMakeRange(0, 7)] isEqualToString:@"s:tweet"]) {			
        //twitter
        NSString *command = [NSString stringWithFormat:@"http://twitter.com/home?status=%@", [[[url absoluteString] substringFromIndex:8] stringByReplacingOccurrencesOfString:@"/" withString:@"%20"]];
        NSLog(@"Command: %@", command);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:command]];
        
	} else if ([[[url absoluteString] substringWithRange:NSMakeRange(0, 5)] isEqualToString:@"s:rtm"]) {
        
        //rtm
        NSString *command = [NSString stringWithFormat:@"http://twitter.com/home?status=d+rtm+%@", [[[url absoluteString] substringFromIndex:6] stringByReplacingOccurrencesOfString:@"/" withString:@"%20"]];
        NSLog(@"Command: %@", command);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:command]];
        
	} else if ([[[url absoluteString] substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"s:en"]) {
        
        //Evernote
        NSString *command = [NSString stringWithFormat:@"http://twitter.com/home?status=d+myen+%@", [[[url absoluteString] substringFromIndex:5] stringByReplacingOccurrencesOfString:@"/" withString:@"%20"]];
        NSLog(@"Command: %@", command);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:command]];
        
	} else if ([[[url absoluteString] substringWithRange:NSMakeRange(0, 5)] isEqualToString:@"s:bit"]) {
        
/* bit.ly if you wanted to add url shortener
        MKBitlyHelper *bitlyHelper = [[MKBitlyHelper alloc] initWithLoginName:@"scoutic" andAPIKey:@"R_0052efdb34257681343eb3a161707046"];
        NSString *shortURL = [bitlyHelper shortenURL:[[url absoluteString] substringFromIndex:6]];
        if (!shortURL) {
            shortURL = @"URL invalid";
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:shortURL message:[NSString stringWithFormat:@"bit.ly reported this as a invalid URL. Always start URL's with http://"]
                                                           delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        else {
            NSLog(@"shortURL: %@", shortURL);
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.URL = [NSURL  URLWithString:shortURL];
            //NSString *longURL = [bitlyHelper expandURL:shortURL];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:[NSString stringWithFormat:@"The shortened link, %@, is ready to be paisted from your clipboard.", shortURL]
                                                           delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
 */
        
	} else if ([[[url absoluteString] substringWithRange:NSMakeRange(0, 5)] isEqualToString:@"s:alm"]) {
        
        //Set Alarm
        NSString *command = [NSString stringWithFormat:@"http://cd.justinjc.com/%@", [[url absoluteString] substringFromIndex:6]];
        NSLog(@"Command: %@", command);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:command]];
        
	} else  {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@ is not yet implemented", [url absoluteString]]
                                                       delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
	}
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Save data if appropriate.
}

- (void)dealloc {

    [window release];
    [super dealloc];
}

@end

//
//  sudoAppDelegate.h
//  sudo
//
//  Created by me on 1/15/11.
//  Copyright 2011 Scoutic LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sudoAppDelegate : NSObject <UIApplicationDelegate> {
@private
    NSURL *goURL;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) NSURL *goURL;

@end

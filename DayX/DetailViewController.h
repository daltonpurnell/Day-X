//
//  DetailViewController.h
//  DayX
//
//  Created by Dalton on 4/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>


// dd @class Entry; to the header view (this is similar to importing, but we already imported Entry in the .m file, so we can use @class in the header)
@class Entry;

@interface DetailViewController : UIViewController

- (void)updateWithTitle:(NSString *)title body:(NSString *)body;

-(void)updateWithEntry:(Entry *)entry;


@end

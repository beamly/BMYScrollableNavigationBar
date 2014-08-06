//
//  BMYScrollableNavigationBarViewController.h
//  BMYScrollableNavigationBarDemo
//
//  Created by Alberto De Bortoli on 17/07/14.
//  Copyright (c) 2014 Beamly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMYScrollableNavigationBarViewController : UIViewController

@property (nonatomic, assign) BOOL enableScrollableNavigationBar;

/**
 *  Call this method to bind the navigation bar to a scrollView.
 *  Need to provide a scrollView with the frame already set.
 *
 *  @param scrollView The scrollView to bind to the navigation bar.
 */
- (void)bindNavigationBarToScrollView:(UIScrollView *)scrollView;

@end

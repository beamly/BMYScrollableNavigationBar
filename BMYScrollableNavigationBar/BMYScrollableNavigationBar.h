//
//  BMYScrollableNavigationBar.h
//  BMYScrollableNavigationBarDemo
//
//  Created by Alberto De Bortoli on 08/07/14.
//  Copyright (c) 2014 Beamly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMYScrollableNavigationBar : UINavigationBar

@property (strong, nonatomic) UIScrollView *scrollView;
@property (assign, nonatomic) CGFloat scrollTolerance;
@property (assign, nonatomic) BOOL viewControllerIsAboutToBePresented;

- (void)resetToDefaultPosition:(BOOL)animated;

@end

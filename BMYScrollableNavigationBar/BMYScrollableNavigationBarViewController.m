//
//  BMYScrollableNavigationBarViewController.m
//  BMYScrollableNavigationBarDemo
//
//  Created by Alberto De Bortoli on 17/07/14.
//  Copyright (c) 2014 Beamly. All rights reserved.
//

#import "BMYScrollableNavigationBarViewController.h"
#import "BMYScrollableNavigationBar.h"

#import <objc/runtime.h>
#import <objc/message.h>

static const CGFloat kStatusBarPlusNavigationBarHeight = 64.0f;

@interface BMYScrollableNavigationBarViewController ()

@property (nonatomic, assign) BOOL viewWillAppearAlreadyBeenCalled;
@property (nonatomic, weak) UIScrollView *trackedScrollView;

- (BMYScrollableNavigationBar *)_scrollableNavigationBar;

@end

@implementation BMYScrollableNavigationBarViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _enableScrollableNavigationBar = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _enableScrollableNavigationBar = YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.enableScrollableNavigationBar) {
        [self _scrollableNavigationBar].scrollView = self.trackedScrollView;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.enableScrollableNavigationBar) {
        [self _repositionNavigationBar];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    if (self.enableScrollableNavigationBar) {
        [self _scrollableNavigationBar].scrollView = self.trackedScrollView;
    }
}

#pragma mark - Public Methods

- (void)bindNavigationBarToScrollView:(UIScrollView *)scrollView {
    if (!self.enableScrollableNavigationBar) {
        return;
    }
    
    if (self.trackedScrollView == scrollView) {
        return;
    }
    
    self.trackedScrollView = scrollView;
    if (self.trackedScrollView) {
        [self _scrollableNavigationBar].scrollView = self.trackedScrollView;
        [self _adjustScrollViewPosition:self.trackedScrollView];
        [self _repositionNavigationBar];
    }
}

#pragma mark - Private Methods

- (BMYScrollableNavigationBar *)_scrollableNavigationBar {
    BMYScrollableNavigationBar *scrollableNavigationBar = (BMYScrollableNavigationBar *)self.navigationController.navigationBar;
    if (![scrollableNavigationBar isKindOfClass:[BMYScrollableNavigationBar class]]) {
        return nil;
    }
    return scrollableNavigationBar;
}

- (void)_adjustScrollViewPosition:(UIScrollView *)scrollView {
    BOOL navBarIsTranslucent = [self.navigationController.navigationBar isTranslucent];
    
    if (!navBarIsTranslucent) {
        CGRect tableViewFrame = scrollView.frame;
        tableViewFrame.origin.y -= kStatusBarPlusNavigationBarHeight;
        tableViewFrame.size.height += kStatusBarPlusNavigationBarHeight;
        scrollView.frame = tableViewFrame;
        
        UIEdgeInsets updatedContentInset = scrollView.contentInset;
        updatedContentInset.top += kStatusBarPlusNavigationBarHeight;
        scrollView.contentInset = updatedContentInset;
        
        UIEdgeInsets updatedScrollIndicatorInsets = scrollView.scrollIndicatorInsets;
        updatedScrollIndicatorInsets.top += kStatusBarPlusNavigationBarHeight;
        scrollView.scrollIndicatorInsets = updatedScrollIndicatorInsets;
    }
    else {
        // with the translucent nav bar, when popping a view controller, the nav bar is misplaced (shrinked)
    }
}

- (void)_repositionNavigationBar {
    BMYScrollableNavigationBar *navBar = [self _scrollableNavigationBar];
    navBar.viewControllerIsAboutToBePresented = YES;
    [navBar resetToDefaultPosition:NO];
}

@end

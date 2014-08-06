//
//  BMYViewController.m.m
//  BMYScrollableNavigationBarDemo
//
//  Created by Alberto De Bortoli on 08/07/14.
//  Copyright (c) 2014 Beamly. All rights reserved.
//

#import "BMYViewController.h"

static BOOL kNavigationBarIsTranslucent = NO;

@interface BMYViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BMYViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ScrollableNavigationBar";
    [self.view addSubview:self.tableView];
    
    self.enableScrollableNavigationBar = YES;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:209.0f/255.0f green:0.0f/255.0f blue:58.0f/255.0f    alpha:1.0f]];
    
    self.tableView.frame = self.view.bounds;
    [self.navigationController.navigationBar setTranslucent:kNavigationBarIsTranslucent];
    [self bindNavigationBarToScrollView:self.tableView];
}

- (void)refresh {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell #%d", (int)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BMYViewController *vc = [[BMYViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

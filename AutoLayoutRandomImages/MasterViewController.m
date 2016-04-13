//
//  MasterViewController.m
//  AutoLayoutRandomImages
//
//  Created by Kim Hansen on 13/04/2016.
//  Copyright © 2016 Webtop A/S. All rights reserved.
//

#import "MasterViewController.h"
#import "ImageTableViewCell.h"
#import "TextTableViewCell.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.estimatedRowHeight = 300.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    int iCellType = (int)0+arc4random() % 2;

//    iCellType = 0;
    
    if (iCellType == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"TextCell" forIndexPath:indexPath];
        NSString *s = @"Gibberish! ";
        int k = (int)1 + arc4random() % 10;
        for (int i = 0; i<k; i++) {
            s = [s stringByAppendingString:@"Gibberish! "];
        }
        [((TextTableViewCell*)cell).Text setText:s];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        [((ImageTableViewCell *)cell).Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Image_%i", (int)1 + arc4random() % 10]]];
    }

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end

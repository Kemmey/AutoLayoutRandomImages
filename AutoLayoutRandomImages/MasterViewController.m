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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    int iCellType = (int)0+arc4random() % 2;

    iCellType = 0;
    
    if (iCellType == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"TextCell" forIndexPath:indexPath];
        [((TextTableViewCell *)cell) setParent:self.tableView];
        NSString *s = @"Gibberish! ";
        int k = (int)1 + indexPath.row % 10;
        for (int i = 0; i<k; i++) {
            s = [s stringByAppendingString:@"Gibberish! "];
        }
        [((TextTableViewCell*)cell).Text setText:@"Loading..."];
        
        [((TextTableViewCell *)cell) setTextAsync:s];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        [((ImageTableViewCell *)cell) setParent:self.tableView];
//        UIImage *image = [self getLoadingImage];
        UIImage *image = [UIImage imageNamed:@"loading-1"];
        [((ImageTableViewCell *)cell).Image setImage:image];
        CGFloat imageViewWidth = self.tableView.bounds.size.width;
        ((ImageTableViewCell *)cell).ImageHeightConstraint.constant = 9.0f / 16.0f * imageViewWidth;
//        ((ImageTableViewCell *)cell).ImageHeightConstraint.constant = image.size.height / image.size.width * imageViewWidth;
        
        UIImage *imageAsync =[UIImage imageNamed:[NSString stringWithFormat:@"Image_%li", (long)1 + indexPath.row % 10]];
        [((ImageTableViewCell *)cell) setImageAsync:imageAsync];

    }

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

#pragma mark - helpers

- (UIImage *) getLoadingImage {
    
    NSArray *animationFrames = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"loading-1"],
                                [UIImage imageNamed:@"loading-2"],
                                [UIImage imageNamed:@"loading-3"],
                                nil];
    UIImage *loadingImage = [UIImage animatedImageWithImages:animationFrames duration:1.0f];
    return loadingImage;
}


@end

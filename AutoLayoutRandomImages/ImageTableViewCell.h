//
//  ImageTableViewCell.h
//  AutoLayoutRandomImages
//
//  Created by Kim Hansen on 13/04/2016.
//  Copyright © 2016 Webtop A/S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ImageHeightConstraint;
@property (weak, nonatomic) UITableView *parent;

- (void)setImageAsync:(UIImage *)image;

@end

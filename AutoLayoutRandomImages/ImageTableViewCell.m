//
//  ImageTableViewCell.m
//  AutoLayoutRandomImages
//
//  Created by Kim Hansen on 13/04/2016.
//  Copyright © 2016 Webtop A/S. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    [NSObject cancelPreviousPerformRequestsWithTarget: self];
}

- (void)setImageDelayed:(UIImage *)image
{
    [self.Image setImage:image];
    CGFloat imageViewWidth = self.contentView.bounds.size.width;
    self.ImageHeightConstraint.constant = image.size.height / image.size.width * imageViewWidth;
    [self.parent beginUpdates];
    [self.parent endUpdates];
}

- (void)setImageAsync:(UIImage *)image
{
    [self performSelector:@selector(setImageDelayed:) withObject:image afterDelay: 0.3f];
}

@end

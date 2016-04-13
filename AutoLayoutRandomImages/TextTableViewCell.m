//
//  TextTableViewCell.m
//  AutoLayoutRandomImages
//
//  Created by Kim Hansen on 13/04/2016.
//  Copyright © 2016 Webtop A/S. All rights reserved.
//

#import "TextTableViewCell.h"

@implementation TextTableViewCell

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

- (void)setTextDelayed:(NSString *)text
{
    [self.Text setText:text];
    [self.parent beginUpdates];
    [self.parent endUpdates];
}

- (void)setTextAsync:(NSString *)text
{
    [self performSelector:@selector(setTextDelayed:) withObject:text afterDelay: 1];
}


@end

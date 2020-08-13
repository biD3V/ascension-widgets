//  AUILabelView.m
//  ascension-small-music
//
//  Created by Antique on 13/08/20.
//  Copyright 2020. Antique. All Rights Reserved.
//


#import "AUILabelView.h"

@implementation AUILabelView
@synthesize titleLabel, artistLabel;
-(id) init {
  if(self = [super init]) {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setup];
  } return self;
}


-(void) setup {
  [self addTitleLabel];
  [self addArtistLabel];
}


-(void) addTitleLabel {
  titleLabel = [UILabel new];
  [titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [titleLabel setFont:[UIFont systemFontOfSize:13 weight:UIFontWeightSemibold]];
  [titleLabel setTextAlignment:NSTextAlignmentLeft];
  [titleLabel setTextColor:[UIColor labelColor]];
  [self addSubview:titleLabel];

  [titleLabel.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
  [titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
  [titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
}


-(void) addArtistLabel {
  artistLabel = [UILabel new];
  [artistLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [artistLabel setFont:[UIFont systemFontOfSize:13 weight:UIFontWeightMedium]];
  [artistLabel setTextAlignment:NSTextAlignmentLeft];
  [artistLabel setTextColor:[UIColor systemPinkColor]];
  [self addSubview:artistLabel];

  // [artistLabel.topAnchor constraintEqualToAnchor:titleLabel.bottomAnchor constant:4].active = YES;
  [artistLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
  [artistLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
  [artistLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
}
@end

//  AUISmallViewController.m
//  ascension-small-music
//
//  Created by Antique on 13/08/20.
//  Copyright 2020. Antique. All Rights Reserved.
//


#import "AUISmallViewController.h"

@implementation AUISmallViewController
-(void) viewDidLoad {
  [super viewDidLoad];

  [self addContentView];
  [self addWidgetNameLabel];
  [self addWidgetIconImageView];
  [self addArtworkImageView];
  [self addLabelView];
}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  controller = [MPMusicPlayerController systemMusicPlayer];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nowPlayingChanged) name:(__bridge NSString *)kMRMediaRemoteNowPlayingInfoDidChangeNotification object:controller];
  [self nowPlayingChanged];
}


-(void) addContentView {
  contentView = [UIView new];
  [contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [contentView setBackgroundColor:[UIColor tertiarySystemBackgroundColor]];
  [contentView setClipsToBounds:YES];
  [contentView.layer setCornerRadius:20];
  [self.view addSubview:contentView];

  [contentView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
  [contentView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
  [contentView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
  [contentView.heightAnchor constraintEqualToAnchor:contentView.widthAnchor].active = YES;
}


-(void) addWidgetNameLabel {
  UILabel *textLabel = [UILabel new];
  [textLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [textLabel setFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]];
  [textLabel setTextAlignment:NSTextAlignmentCenter];
  [textLabel setTextColor:[UIColor labelColor]];
  [textLabel setText:@"Music"];
  [self.view addSubview:textLabel];

  [textLabel.topAnchor constraintEqualToAnchor:contentView.bottomAnchor constant:4].active = YES;
  [textLabel.leadingAnchor constraintEqualToAnchor:contentView.leadingAnchor].active = YES;
  [textLabel.trailingAnchor constraintEqualToAnchor:contentView.trailingAnchor].active = YES;
}


-(void) addWidgetIconImageView {
  widgetIconImageView = [UIImageView new];
  [widgetIconImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [widgetIconImageView setImage:[[UIImage imageWithContentsOfFile:@"/Library/HSWidgets/***.bundle/icon@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
  [widgetIconImageView setTintColor:[UIColor labelColor]];
  [contentView addSubview:widgetIconImageView];

  [widgetIconImageView.topAnchor constraintEqualToAnchor:contentView.topAnchor constant:16].active = YES;
  [widgetIconImageView.trailingAnchor constraintEqualToAnchor:contentView.trailingAnchor constant:-16].active = YES;
  [widgetIconImageView.widthAnchor constraintEqualToConstant:24].active = YES;
  [widgetIconImageView.heightAnchor constraintEqualToConstant:24].active = YES;
}


-(void) addArtworkImageView {
  artworkImageView = [UIImageView new];
  [artworkImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [artworkImageView setBackgroundColor:[UIColor secondarySystemBackgroundColor]];
  [artworkImageView setClipsToBounds:YES];
  [artworkImageView.layer setCornerRadius:8];
  [contentView addSubview:artworkImageView];

  [artworkImageView.topAnchor constraintEqualToAnchor:contentView.topAnchor constant:16].active = YES;
  [artworkImageView.leadingAnchor constraintEqualToAnchor:contentView.leadingAnchor constant:16].active = YES;
  [artworkImageView.trailingAnchor constraintEqualToAnchor:widgetIconImageView.leadingAnchor constant:-16].active = YES;
  [artworkImageView.heightAnchor constraintEqualToAnchor:artworkImageView.widthAnchor].active = YES;
}


-(void) addLabelView {
  labelView = [AUILabelView new];
  [labelView.titleLabel setText:@"Unknown"];
  [labelView.artistLabel setText:[[UIDevice currentDevice] model]];
  [contentView addSubview:labelView];

  [labelView.topAnchor constraintEqualToAnchor:artworkImageView.bottomAnchor constant:8].active = YES;
  [labelView.bottomAnchor constraintEqualToAnchor:contentView.bottomAnchor constant:-16].active = YES;
  [labelView.leadingAnchor constraintEqualToAnchor:contentView.leadingAnchor constant:16].active = YES;
  [labelView.trailingAnchor constraintEqualToAnchor:contentView.trailingAnchor constant:-16].active = YES;
}


-(void) nowPlayingChanged {
  MPMediaItem *song = [controller nowPlayingItem];
  if (song) {
    [labelView.titleLabel setText:song.title];
    [labelView.artistLabel setText:song.artist];

    [artworkImageView setImage:[song.artwork imageWithSize:CGSizeMake(512, 512)]];
  } else {
    [labelView.titleLabel setText:@"Unknown"];
    [labelView.artistLabel setText:[[UIDevice currentDevice] model]];

    [artworkImageView setImage:nil];
  }
}


+(HSWidgetSize) minimumSize {
	return HSWidgetSizeMake(2, 2);
}
@end

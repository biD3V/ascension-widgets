//  AUISmallViewController.h
//  ascension-small-music
//
//  Created by Antique on 13/08/20.
//  Copyright 2020. Antique. All Rights Reserved.
//


#import <HSWidgets/HSWidgetViewController.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MediaRemote/MediaRemote.h>

#import "AUILabelView.h"

@interface AUISmallViewController : HSWidgetViewController {
  MPMusicPlayerController *controller;

  UIView *contentView;
  UIImageView *artworkImageView, *widgetIconImageView;
  AUILabelView *labelView;
}
@end

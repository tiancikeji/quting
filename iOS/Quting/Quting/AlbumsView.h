//
//  AlbumsView.h
//  Quting
//
//  Created by Johnil on 13-5-29.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircularProgressView.h"

@interface AlbumsView : UIView <CircularProgressDelegate>

@property (nonatomic, strong) UILabel *label;

@end

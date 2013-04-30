//
//  StoryCell.h
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Story;

@interface StoryCell : UITableViewCell {
    UILabel *headlineLabel;
    UILabel *briefLabel;
    UIImageView *imageView;
    
    Story *story;
}

@property (nonatomic, strong) IBOutlet UILabel *headlineLabel;
@property (nonatomic, strong) IBOutlet UILabel *briefLabel;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) Story *story;

@end

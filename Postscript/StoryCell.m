//
//  StoryCell.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StoryCell.h"
#import "Story.h"

@implementation StoryCell

@synthesize headlineLabel, briefLabel, imageView, story;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {						
		headlineLabel = [[UILabel alloc] init];
		headlineLabel.numberOfLines = 0;
		headlineLabel.highlightedTextColor = [UIColor whiteColor];
		[self.contentView addSubview: headlineLabel];
		
		briefLabel = [[UILabel alloc] init];
		briefLabel.numberOfLines = 0;
		briefLabel.textColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:.7];
		briefLabel.highlightedTextColor = [UIColor whiteColor];
		[self.contentView addSubview: briefLabel];
		
		imageView = [[UIImageView alloc] init];
		[self.contentView addSubview:imageView];
	}
    return self;
}


- (void) setStory:(Story *)newStory {
    story = newStory;
    [self layout];
}

- (void) layout {
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    CGFloat deviceWidth = 320 - 20;
    CGFloat width = self.story.image? deviceWidth - 80 : deviceWidth;

    NSString *headline = [story headline];
    NSString *brief =  [story brief];

    self.headlineLabel.text = headline;
    self.briefLabel.text = brief;
    
    UIFont *headlineFont = [UIFont fontWithName:@"Georgia-Bold" size:14];
	UIFont *briefFont = [UIFont fontWithName:@"Georgia" size:12];
	
	headlineLabel.font = headlineFont;
	briefLabel.font = briefFont;
	
	headlineLabel.text = headline;
	briefLabel.text = brief;

    CGSize headlineSize = [headline sizeWithFont: headlineFont constrainedToSize: CGSizeMake(width, 50) ];
    CGFloat headlineHeight = headlineSize.height;

    CGSize briefSize = [brief sizeWithFont: briefFont constrainedToSize: CGSizeMake(width, 65-headlineHeight)];
    CGFloat briefHeight = briefSize.height;

    CGRect headlineRect = CGRectMake(10, 10, width, headlineHeight);
    CGRect briefRect = CGRectMake(10, 10 + headlineHeight + 5, width, briefHeight);

    self.headlineLabel.frame = headlineRect;
    self.briefLabel.frame = briefRect;

    if (self.story.image){
        self.imageView.image = self.story.image;
        CGRect imageRect = CGRectMake(width + 20, 15, 60, 60);
        self.imageView.frame = imageRect;
    }
    else {
        self.imageView.image = nil;
        [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(layout) name:@"ImageDidLoad" object:self.story.image];
    }
}
@end

//
//  MenuBarViewController.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuBarViewController.h"

@implementation MenuBarViewController

@synthesize scrollView;
@synthesize delegate;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview: self.scrollView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void) setSelectionChoices:(NSArray *)choices {
    for (UIView *subview in self.scrollView.subviews)
        [subview removeFromSuperview];
    
    UIFont *font = [UIFont fontWithName:@"Georgia" size:15];
    
    UIImage *selectedImage = [[UIImage imageNamed:@"oval_green.png"]stretchableImageWithLeftCapWidth:9 topCapHeight:0];
    
    CGFloat x = 5;
    
    NSMutableArray *newButtons = [NSMutableArray arrayWithCapacity: [choices count]];
    for (NSString *choice in choices){
        UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
        
        [button setTitle: choice forState:UIControlStateNormal];
        [button setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [button setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
        [button setBackgroundImage:selectedImage forState:UIControlStateSelected];
        button.titleLabel.font = font;
        
        CGFloat buttonWidth = [button.titleLabel.text sizeWithFont: font].width + 10;
        button.frame = CGRectMake(x, 2, buttonWidth, 26);
        x += buttonWidth + 5;
        
        [button addTarget: self action:@selector(selectionChanged:) forControlEvents:UIControlEventTouchUpInside];
        
        [newButtons addObject: button]; 
        [self.scrollView addSubview: button];
    }
    
    buttons = [NSArray arrayWithArray: newButtons];
    if ([buttons count] > 0)
        [[buttons objectAtIndex: 0] setSelected:YES];
    
    [self.scrollView setContentSize: CGSizeMake(x, 30)];
    
}

- (void) selectionChanged: (id) sender {
    NSInteger selected = [buttons indexOfObject: sender];
    for (UIButton *button in buttons) button.selected = NO;
    [sender setSelected: YES];
    [delegate selectionChanged: selected];
}



@end

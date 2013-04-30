//
//  MenuBarViewController.h
//  Postscript
//
//  Created by Jeremy Cohen on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuBarDelegate <NSObject>

- (void) selectionChanged: (NSInteger) newSelection;

@end


@interface MenuBarViewController : UIViewController {
    UIScrollView *scrollView;
    
    NSArray *buttons;    
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, weak) id <MenuBarDelegate> delegate;

- (void) setSelectionChoices: (NSArray *) choices;

@end

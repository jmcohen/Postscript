//
//  PostscriptViewController.h
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuBarViewController.h"
@class Postscript;
@class Section;


@interface PostscriptViewController : UIViewController <MenuBarDelegate, UITableViewDelegate, UITableViewDataSource> {
    Postscript *postscript;
    Section *currentSection;
    
    MenuBarViewController *menuBarController;
    
    UIView *menuBarView;
    UITableView *sectionView;
}

@property (nonatomic, strong) Postscript *postscript;
@property (nonatomic, strong) Section *currentSection;
@property (nonatomic, strong) MenuBarViewController *menuBarController;
@property (nonatomic, strong) IBOutlet UIView *menuBarView;
@property (nonatomic, strong) IBOutlet UITableView *sectionView;

- (void) update;
- (void) didUpdate;

@end

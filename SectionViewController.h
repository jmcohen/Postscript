//
//  ArticleListViewController.h
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Section;

@interface SectionViewController : UITableViewController {
    Section *section;
}

@property (nonatomic, strong) Section *section;

@end

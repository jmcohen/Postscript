//
//  FavoritesViewController.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FavoritesViewController.h"
#import "SectionViewController.h"
#import "Section.h"
#import "Favorites.h"
#import "AppDelegate.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (void) viewWillAppear:(BOOL)animated 
{
    SectionViewController *favoritesSectionViewController = [self.viewControllers objectAtIndex:0];
    favoritesSectionViewController.section = [Favorites loadFavorites];   
    [favoritesSectionViewController.tableView reloadData];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

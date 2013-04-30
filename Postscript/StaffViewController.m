//
//  StaffViewController.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StaffViewController.h"
#import "TBXML+HTTP.h"
#import "AppDelegate.h"
#import "Staff.h"

@interface StaffViewController ()

@end

@implementation StaffViewController

@synthesize staff;

- (id)initWithStyle:(UITableViewStyle)style
{    
	if (self = [super init]){
    }
    return self;
}

- (void)viewDidLoad
{
    AppDelegate *delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    self.staff = delegate.staff;
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UITableViewCell *) tableView: (UITableView *) tv cellForRowAtIndexPath: (NSIndexPath *) indexPath {
	UITableViewCell *cell =[tv dequeueReusableCellWithIdentifier:@"StaffMemberCell"];
	NSInteger row = indexPath.row;
	NSInteger section = indexPath.section;
	cell.textLabel.text = [[self.staff.persons objectAtIndex:section] objectAtIndex:row];
	return cell;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	return [self.staff.titles count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [self.staff.titles objectAtIndex:section];
}

- (NSInteger) tableView: (UITableView *) tv numberOfRowsInSection: (NSInteger) section {
	return [[self.staff.persons objectAtIndex:section] count];
}


@end

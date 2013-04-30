//
//  PostscriptViewController.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PostscriptViewController.h"
#import "SectionViewController.h"
#import "Postscript.h"
#import "Section.h"
#import "AppDelegate.h"
#import "MenuBarViewController.h"
#import "Story.h"
#import "StoryCell.h"
#import "ArticleViewController.h"
#import "Connectivity.h"

@interface PostscriptViewController ()

@end

@implementation PostscriptViewController

@synthesize postscript;
@synthesize currentSection;

@synthesize sectionView, menuBarView;
@synthesize menuBarController;

- (void) viewDidLoad {
    [self update];
    menuBarController = [[MenuBarViewController alloc] init];
    [self.menuBarView addSubview:menuBarController.view];
    [super viewDidLoad];
}

- (void) update {
    self.postscript = [[Postscript alloc] init];
    [self.postscript updateFromAddress: @"http://www.parkpostscript.com/iphone/article_list_november.xml"];    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didUpdate) name:@"DownloadComplete" object:nil];
}

- (void) didUpdate {
    [self.menuBarController setSelectionChoices:self.postscript.sectionNames];
    self.currentSection = [self.postscript.sections objectAtIndex:0];
    [self.sectionView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

- (void) selectionChanged:(NSInteger)newSelection {
    NSLog(@"selection changed");
    self.currentSection = [self.postscript.sections objectAtIndex:newSelection];
    [self.sectionView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currentSection.stories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StoryCell";
    StoryCell *cell = (StoryCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[StoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    Story *story = (Story *) [self.currentSection.stories objectAtIndex:indexPath.row];
    [cell setStory:story];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Story *story = [self.currentSection.stories objectAtIndex:indexPath.row];
    if ([Connectivity checkConnectivity])
        [self performSegueWithIdentifier:@"StoryPressed" sender:story];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"StoryPressed"]){
        ArticleViewController *articleViewController = segue.destinationViewController;
        articleViewController.story = (Story *) sender;
    }
}

@end

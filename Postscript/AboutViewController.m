//
//  AboutViewController.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"
#import "Connectivity.h"
#import <MessageUI/MessageUI.h>
#import "AppDelegate.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) viewDidLoad 
{
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        if ([Connectivity checkConnectivity])
            [self performSegueWithIdentifier:@"StaffPressed" sender:self];
        
    } else if (indexPath.section == 1){
        if (indexPath.row == 0){
            MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
            [mailViewController setSubject:@"Letter to the Editor"];
            [mailViewController setToRecipients: [NSArray arrayWithObject: @"postscript@parkschool.net"]];
            mailViewController.mailComposeDelegate = self;
            [self presentModalViewController: mailViewController animated:YES];
        }
    } else if (indexPath.section == 2){
        if (indexPath.row == 0){
            [[UIApplication sharedApplication] openURL:[[NSURL alloc] initWithString: @"http://www.parkpostscript.com"]];
        } else if (indexPath.row == 1){
            [[UIApplication sharedApplication] openURL:[[NSURL alloc] initWithString: @"http://www.parkschool.net/pubs/index.cfm?type=list&objectid=652"]];
        } else if (indexPath.row == 2){
            [[UIApplication sharedApplication] openURL:[[NSURL alloc] initWithString: @"http://www.parkschool.net"]];
        }
        
    } else if (indexPath.section == 3){
        if (indexPath.row == 0){
            MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
            [mailViewController setSubject:@"iPhone App Bug Report"];
            [mailViewController setToRecipients: [NSArray arrayWithObject: @"postscript@parkschool.net"]];
            mailViewController.mailComposeDelegate = self;
            [self presentModalViewController: mailViewController animated:YES];
        } else if (indexPath.row == 1){
            MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
            [mailViewController setSubject:@"iPhone App Feature Suggestion"];
            [mailViewController setToRecipients: [NSArray arrayWithObject: @"postscript@parkschool.net"]];
            mailViewController.mailComposeDelegate = self;
            [self presentModalViewController: mailViewController animated:YES];        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self becomeFirstResponder];
	[self dismissModalViewControllerAnimated:YES];
}

@end

//
//  ArticleViewControllerViewController.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArticleViewController.h"
#import "Story.h"
#import "Link.h"
#import "AppDelegate.h"
#import "Postscript.h"
#import "Favorites.h"
#import <MessageUI/MessageUI.h>

@interface ArticleViewController ()

@end

@implementation ArticleViewController

@synthesize webView, story;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.story.headline;
    [webView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: [self.story.link iPhoneArticleLink]]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.webView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) adjustTextFontSize {
	AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
	NSString *jsString = [[NSString alloc] initWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%d%%'", delegate.textFontSize];
	[webView stringByEvaluatingJavaScriptFromString:jsString];
}

- (IBAction)increaseTextSize:(id)sender {
	AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [delegate makeTextFontSizeBigger];
	[self adjustTextFontSize];
}

- (IBAction)decreaseTextSize:(id)sender {
	AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [delegate makeTextFontSizeSmaller];
    [self adjustTextFontSize];
}

- (IBAction) makeFavorite:(id)sender{
    [Favorites addFavorite:self.story];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Article Saved" message:@"This article is now saved as a favorite.  Tap to the favorites tab to view your favorites." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction) sendArticle:(id)sender{
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
    [mailViewController setSubject:[NSString stringWithFormat: @"Postscript: %@", self.story.headline]];
    [mailViewController setMessageBody:[NSString stringWithFormat:@"Check out this Postscript article: %@", [self.story.link webArticleLink]] isHTML:YES];
    mailViewController.mailComposeDelegate = self;
    [self presentModalViewController: mailViewController animated:YES];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self becomeFirstResponder];
	[self dismissModalViewControllerAnimated:YES];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
	[self adjustTextFontSize];
}



@end

//
//  ArticleViewControllerViewController.h
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@class Story;

@interface ArticleViewController : UIViewController<MFMailComposeViewControllerDelegate, UIWebViewDelegate> {
    UIWebView *webView;
    Story *story;
}

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) Story *story;

- (IBAction)increaseTextSize:(id)sender;
- (IBAction)decreaseTextSize:(id)sender;
- (IBAction) sendArticle: (id) sender;
- (IBAction) makeFavorite: (id) sender;

@end

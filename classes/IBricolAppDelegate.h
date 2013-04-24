//
//  IBricolAppDelegate.h
//  IBricol
//
//  Created by yohann streibel on 29/01/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PickerViewController;

@interface IBricolAppDelegate : NSObject <UIApplicationDelegate> {
@public    
	UIWindow *window;
	IBOutlet UITextField *localisation;
	IBOutlet UITextField *date;
	IBOutlet UILabel *reponse;
	IBOutlet UIImageView *feux;
	PickerViewController *pvController;
	
}

- (IBAction) actionValider;
- (IBAction) actionPickerView;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end


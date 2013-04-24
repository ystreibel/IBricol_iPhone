//
//  PickerViewController.m
//  PickerView
//
//  Created by iPhone SDK Articles on 1/24/09.
//  Copyright www.iPhoneSDKArticles.com 2009. 
//

#import "PickerViewController.h"


@implementation PickerViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	arrayDate = [[NSMutableArray alloc] init];
	[arrayDate addObject:@"Aujourd'hui"];
	[arrayDate addObject:@"Ce soir"];
	[arrayDate addObject:@"Demain"];
	[arrayDate addObject:@"Demain soir"];
	[arrayDate addObject:@"Après demain"];
	[arrayDate addObject:@"Après demain soir"];

	app = (IBricolAppDelegate*)[[UIApplication sharedApplication] delegate];
	[pickerView selectRow:[arrayDate indexOfObject:app->date.text] inComponent:0 animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	
	return [arrayDate count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	return [arrayDate objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	//Changement de la valeur du champs date
	app->date.text = [arrayDate objectAtIndex:row];
	[self.view removeFromSuperview];
	NSLog(@"Selected Date: %@. Index of selected date: %i", [arrayDate objectAtIndex:row], row);
	NSLog(@"Object a l'index %i", [arrayDate indexOfObject:app->date.text] );
	NSLog(@" la vue utiliser : %@",self.view);
}

- (void)dealloc {
	[app release];
	[pickerView release];
	[arrayDate release];
    [super dealloc];
}

@end

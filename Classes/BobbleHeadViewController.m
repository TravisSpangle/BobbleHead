//
//  BobbleHeadViewController.m
//  BobbleHead
//
//  Created by Travis Spangle on 1/12/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import "BobbleHeadViewController.h"
#import "BobbleHead.h"	

@implementation BobbleHeadViewController

@synthesize headSpace;
@synthesize bHead;


-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	NSLog(@"Monitoring accelerometer");
	self.bHead = [[[BobbleHead alloc] init] autorelease];
	
	UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];

	[a setUpdateInterval:.2];
	[a setDelegate:self];
	
	[[self view] becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	[[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


#pragma mark -
#pragma mark Accelerao
- (void)accelerometer:(UIAccelerometer *)meter
		didAccelerate:(UIAcceleration *) accel
{	
	//NSLog(@"X: %f and Y: %f",[accel x], [accel y]);
	
	CGPoint pos = headSpace.center;
	
	[UIView beginAnimations:nil context:NULL];
	
	[UIView setAnimationDuration:0.1];
	[UIView setAnimationRepeatAutoreverses:YES];
	
	headSpace.center = [bHead bobbleHeadCords:pos accelerometerData:accel];
	
	[UIView commitAnimations];

	//Start moving back to center
	[UIView beginAnimations:nil context:NULL];
		headSpace.center = pos;
	[UIView commitAnimations];

}


@end

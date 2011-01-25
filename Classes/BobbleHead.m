//
//  BobbleHead.m
//  BobbleHead
//
//  Created by Travis Spangle on 1/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BobbleHead.h"

@implementation BobbleHead

@synthesize xCord, yCord;

-(id)init {
	[super init];
		
	CGRect cgBounds = [[UIScreen mainScreen] bounds];
	
	NSLog(@"Setting Max Width to %f and height to %f", cgBounds.size.width, cgBounds.size.height);
	xMaxWidth = cgBounds.size.width;
	yMaxHeight = cgBounds.size.height;
	
	return self;
}

- (CGPoint)bobbleHeadCords:(CGPoint)position
accelerometerData:(UIAcceleration *) accel {
	
	NSLog(@"Accel X: %f Accel Y: %f", [self round:[accel x]], [self round:[accel y]]);

	if ([self shouldIBobble:[accel x] lastPosition:xCord]) {
		//NSLog(@"Moving X Axis: %f",[accel x] * 2.0);
		//position.x = position.x * 0.8 + [accel x] * 2.0;
		position.x = position.x + ( position.x * ([accel x]/2));
		
		position.x = [self keepCenterWithinBoundryCords:position.x maxPosition:xMaxWidth];
	}
	
	if ([self shouldIBobble:[accel y] lastPosition:yCord]) {
		//position.y = position.y * 0.8 - [accel y] * 2.0;
		position.y = position.y + ( position.y * ([accel y]/2) );
		
		position.y = [self keepCenterWithinBoundryCords:position.y maxPosition:yMaxHeight];
	}
	
	xCord = [self round:[accel x]];
	yCord = [self round:[accel y]];
	
	return position;
}

- (BOOL)shouldIBobble:(float)accel
		 lastPosition:(float)lastAccel {
	
	if (lastAccel == [self round:accel]) {
		return NO;
	}
	
	return YES;
}

- (float)keepCenterWithinBoundryCords:(float)no
	maxPosition:(float)maxP {
	if (no < 0) {
		return 0.0f;
	} else if (no > maxP) {
		return maxP;
	} 
	
	return no;
}

- (float)round:(float)no {
	int asInt;
	asInt = no * 10.0f; //make 1.0234 = 102.34.  Setting to int truncates it as 102.
	return asInt/10.0f; //make 102 = 1.02, return.
}

@end

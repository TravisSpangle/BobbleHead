//
//  BobbleHead.m
//  BobbleHead
//
//  Created by Travis Spangle on 1/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BobbleHead.h"

@implementation BobbleHead

-(id)init {
	[super init];
	//TODO: main appliction should be able to set this.
	xCord = 0.00f;
	yCord = 0.00f;
	
	return self;
}

- (CGPoint)bobbleHeadCords:(CGPoint)position
accelerometerData:(UIAcceleration *) accel {
	
	NSLog(@"Accel X: %f Accel Y: %f", [self round:[accel x]], [self round:[accel y]]);
	
	//NSLog(@"Width: %f Height %f"bounds.width, bounds.height);
	
	//TODO: Get a better equation - and set a max value on accel to prevent bobble from going off screen
	if ([self shouldIBobble:[accel x] lastPosition:xCord]) {
		position.x = position.x * 0.8 + [accel x] * 2.0;
	}
	
	if ([self shouldIBobble:[accel y] lastPosition:yCord]) {
		position.y = position.y * 0.8 - [accel y] * 2.0;
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

- (float)round:(float)no {
	int asInt;
	asInt = no * 10.0f; //make 1.0234 = 102.34.  Setting to int truncates it as 102.
	return asInt/10.0f; //make 102 = 1.02, return.
}

@end

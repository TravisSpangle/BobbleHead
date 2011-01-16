//
//  BobbleHead.m
//  BobbleHead
//
//  Created by Travis Spangle on 1/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BobbleHead.h"

@implementation BobbleHead

- (float)getNewPoint:(float)position
   accelerometerData:(float)accel {
	
	NSLog(@"getNewPoint called with position %f and accelerometer data %f", position, accel);
		
	return position * 0.8 - accel * 2.0;
	//return 0.00f;
}

@end

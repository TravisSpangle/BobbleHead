//
//  BobbleHead.h
//  BobbleHead
//
//  Created by Travis Spangle on 1/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BobbleHead : NSObject {
	float xCord;
	float yCord;
}

- (CGPoint)bobbleHeadCords:(CGPoint)position
accelerometerData:(UIAcceleration *) accel;

- (BOOL)shouldIBobble:(float)accel
		 lastPosition:(float)pos;

- (float)round:(float)no;

@end

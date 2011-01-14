//
//  BobbleHeadViewController.h
//  BobbleHead
//
//  Created by Travis Spangle on 1/12/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BobbleHeadViewController : UIViewController  <UIAccelerometerDelegate>{
	IBOutlet UIImageView *headToBobble;
	IBOutlet UIView *headSpace;

}
@property(nonatomic, retain) IBOutlet UIImageView *headToBobble;
@property(nonatomic, retain) IBOutlet UIView *headSpace;

@end

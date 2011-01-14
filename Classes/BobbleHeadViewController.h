//
//  BobbleHeadViewController.h
//  BobbleHead
//
//  Created by Travis Spangle on 1/12/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BobbleHead;

@interface BobbleHeadViewController : UIViewController  <UIAccelerometerDelegate>{
	IBOutlet UIView *headSpace;
	
	BobbleHead *bHead;

}
@property(nonatomic, retain) IBOutlet UIView *headSpace;
@property(nonatomic, retain) BobbleHead *bHead;

@end

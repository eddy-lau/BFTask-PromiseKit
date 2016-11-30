//
//  BFTask_PromiseKit.h
//  Meeting
//
//  Created by Eddie Hiu-Fung Lau on 29/11/2016.
//  Copyright © 2016 Eddie Hiu-Fung Lau. All rights reserved.
//

#import <Bolts/Bolts.h>
#import <PromiseKit/PromiseKit.h>

@interface BFTask (PromiseKit)

- (AnyPromise *) toPromise;

@end

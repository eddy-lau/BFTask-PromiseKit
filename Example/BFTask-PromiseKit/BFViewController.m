//
//  BFViewController.m
//  Bolts-PromiseKit
//
//  Created by Eddie Lau on 11/30/2016.
//  Copyright (c) 2016 Eddie Lau. All rights reserved.
//

#import "BFViewController.h"
#import "BFTask+PromiseKit.h"

@interface BFViewController () {

    IBOutlet UIButton *startButton;
    IBOutlet UILabel *textLabel;
    IBOutlet UIActivityIndicatorView *activityIndicator;

}
@end

@implementation BFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    activityIndicator.hidden = YES;
    
}

- (BFTask *) asyncBFTask {
    
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    
    // This task does nothing, just wait for a few seconds
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [task setResult:@"Task 1 is done!"];
        
    });
    
    return task.task;
    
}
    
- (AnyPromise *) asyncPromise {
    
    // This task does nothing, just wait for a few seconds
    return [AnyPromise promiseWithResolverBlock:^(PMKResolver resolve) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            resolve(@"Task 2 is done!");
            
        });
        
        
    }];
    
}
    
- (IBAction)didTapStartButton:(id)sender {
    
    textLabel.text = nil;
    activityIndicator.hidden = NO;
    [activityIndicator startAnimating];
    startButton.enabled = NO;
    
    [[self asyncBFTask] toPromise].then(^(NSString *result) {
        
        textLabel.text = result;
        return [self asyncPromise];
        
    }).then(^(NSString *result) {
        
        textLabel.text = result;
        
    }).always(^() {
       
        [activityIndicator stopAnimating];
        activityIndicator.hidden = YES;
        startButton.enabled = YES;
        
    });
    
}

@end

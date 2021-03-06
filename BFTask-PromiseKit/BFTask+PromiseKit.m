//
//  BFTask_PromiseKit.m
//  Meeting
//
//  Created by Eddie Hiu-Fung Lau on 29/11/2016.
//  Copyright © 2016 Eddie Hiu-Fung Lau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFTask+PromiseKit.h"


@implementation BFTask (PromiseKit)

- (AnyPromise * _Nonnull ) toPromise {
    
    AnyPromise *promise = [AnyPromise promiseWithAdapterBlock:^(PMKAdapter  _Nonnull adapter) {
        
        [self continueWithBlock:^id _Nullable(BFTask * _Nonnull t) {
           
            if (t.isCancelled) {
                
                NSError *err =
                    [NSError errorWithDomain:PMKErrorDomain
                                        code:-1
                                    userInfo:@{NSLocalizedFailureReasonErrorKey:@"Cancelled"}];
                
                adapter(nil, err);
                
            } else if (t.error) {
                
                adapter(nil, t.error);
                
            } else {
                
                adapter(t.result, nil);
            }
            
            return nil;
        }];
        
    }];
    return promise;
    
}

@end

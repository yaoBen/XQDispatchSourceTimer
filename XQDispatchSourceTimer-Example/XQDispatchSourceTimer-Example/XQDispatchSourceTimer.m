//
//  XQDispatchSourceTimer.m
//  GCD-Basic
//
//  Created by pinba on 2020/11/10.
//  Copyright © 2020 pinba. All rights reserved.
//

#import "XQDispatchSourceTimer.h"

@interface XQDispatchSourceTimer ()
@property (nonatomic, strong) dispatch_source_t source;
@property (nonatomic,assign) NSUInteger progress;
/** 是否已经取消了 */
@property (nonatomic,assign) BOOL isCancel;
@end

@implementation XQDispatchSourceTimer
- (dispatch_source_t)source
{
    if (_source == NULL) {
        _source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, DISPATCH_TARGET_QUEUE_DEFAULT);
    }
    return _source;
}

- (void)pause
{
    dispatch_suspend(self.source);
}
- (void)start
{
    if (!self.isCancel) {
        dispatch_resume(self.source);
    }
}
- (void)cancel
{
    self.isCancel = YES;
    dispatch_source_cancel(self.source);
}
- (void)dispatchSourceTimer:(int)countdown handle:(void (^)(NSUInteger progress))handleBlock interval:(CGFloat)interval
{
    __block int time = countdown;
   
    dispatch_source_set_event_handler(self.source, ^{
        if (time <= 0) {
            self.isCancel = YES;
            dispatch_source_cancel(self.source);
        }else{
            time--;
            self.progress = time;
            if (handleBlock) {
                handleBlock(time);
            }
        }
    });
    dispatch_source_set_timer(self.source, dispatch_walltime(NULL, 0), interval*NSEC_PER_SEC, 0);
    dispatch_resume(self.source);
    
}
@end

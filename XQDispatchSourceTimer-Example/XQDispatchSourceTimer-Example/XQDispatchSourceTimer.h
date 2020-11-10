//
//  XQDispatchSourceTimer.h
//  GCD-Basic
//
//  Created by pinba on 2020/11/10.
//  Copyright © 2020 pinba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
NS_ASSUME_NONNULL_BEGIN

@interface XQDispatchSourceTimer : NSObject

/**
 countdown   :倒计时数
 handleBlock :回调block，progress当前的倒计时计数
 interval    :倒计时间隔
 */
- (void)dispatchSourceTimer:(int)countdown handle:(void (^)(NSUInteger progress))handleBlock interval:(CGFloat)interval;
- (void)pause;
- (void)start;
- (void)cancel;
@end

NS_ASSUME_NONNULL_END

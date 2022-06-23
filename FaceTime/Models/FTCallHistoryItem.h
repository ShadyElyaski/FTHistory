//
//  FTCall.h
//  FaceTime
//
//  Created by Shady Elyaski on 6/22/22.
//

#import <Foundation/Foundation.h>

@class FTCall;

NS_ASSUME_NONNULL_BEGIN

@interface FTCallHistoryItem : NSObject

@property(nonatomic, readonly) FTCall *call;
@property(nonatomic, readonly) uint count;

-(id)initWithCall:(FTCall *)call
            count:(uint)count;

@end

NS_ASSUME_NONNULL_END

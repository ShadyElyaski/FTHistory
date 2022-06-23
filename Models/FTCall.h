//
//  FTCall.h
//  FTHistory
//
//  Created by Shady Elyaski on 6/22/22.
//

#import <Foundation/Foundation.h>

@class FTCallerID;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FTCallDirection) {
    incoming,
    outgoing,
};

typedef NS_ENUM(NSUInteger, FTCallStatus) {
    connected,
    missed,
    unknown,
};

@interface FTCall : NSObject

@property(nonatomic, readonly) FTCallerID *callerId;
@property(nonatomic, readonly) NSDate *date;
@property(nonatomic, readonly) FTCallDirection direction;
@property(nonatomic, readonly) BOOL isAnswered;

- (id)initWithCallerId:(FTCallerID *)callerId
                  date:(NSDate *)date
             direction:(FTCallDirection)direction
            isAnswered:(BOOL)isAnswered;

- (FTCallStatus)getCallStatus;

@end

NS_ASSUME_NONNULL_END

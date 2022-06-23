//
//  FTCall.h
//  FaceTime
//
//  Created by Shady Elyaski on 6/22/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FTCallerID : NSObject

@property(nonatomic, readonly, nullable) NSString *countryCode;
@property(nonatomic, readonly) NSString *phoneNumber;

-(id)initWithPhoneNumber:(NSString *)phoneNumber;
-(id)initWithPhoneNumber:(NSString *)phoneNumber
             countryCode:(NSString *)countryCode;

- (NSString *)normalizedPhoneNumber;

@end

NS_ASSUME_NONNULL_END

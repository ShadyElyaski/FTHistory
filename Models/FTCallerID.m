//
//  FTCall.m
//  FTHistory
//
//  Created by Shady Elyaski on 6/22/22.
//

#import "FTCallerID.h"

@implementation FTCallerID

- (id)initWithPhoneNumber:(NSString *)phoneNumber
{
  if (self = [super init])
  {
    _phoneNumber = phoneNumber;
  }
  return self;
}

-(id)initWithPhoneNumber:(NSString *)phoneNumber
             countryCode:(NSString *)countryCode
{
  if (self = [super init])
  {
    _phoneNumber = phoneNumber;
    _countryCode = countryCode;
  }
  return self;
}



- (NSString *)normalizedPhoneNumber
{
  NSString *normalizedPhoneNumber = [self normalizedNumber:self.phoneNumber];
  NSString *normalizedCountryCode = [self normalizedNumber:self.countryCode] ?: @"";
  return [normalizedCountryCode stringByAppendingString:normalizedPhoneNumber];
}

- (NSString *)description
{
  return [self normalizedPhoneNumber];
}

- (BOOL)isEqual:(nullable FTCallerID *)object
{
  return [[self normalizedPhoneNumber] isEqualToString:[object normalizedPhoneNumber]];
}

#pragma Private Methods

- (NSString *)normalizedNumber:(NSString *)number
{
  NSString *normalizedPhoneNumber = [number stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  normalizedPhoneNumber = [number stringByTrimmingCharactersInSet:[NSCharacterSet symbolCharacterSet]]; // Removes '+'
  normalizedPhoneNumber = [normalizedPhoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
  normalizedPhoneNumber =
  [normalizedPhoneNumber stringByReplacingOccurrencesOfString:@"^0+|\\s"
                                                   withString:@""
                                                      options:NSRegularExpressionSearch
                                                        range:NSMakeRange(0, normalizedPhoneNumber.length)]; // Removes zeroes or spaces
  return normalizedPhoneNumber;
}

@end

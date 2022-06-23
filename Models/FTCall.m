//
//  FTCall.m
//  FTHistory
//
//  Created by Shady Elyaski on 6/22/22.
//

#import "FTCall.h"
#import "FTCallerID.h"

@implementation FTCall

- (id)initWithCallerId:(FTCallerID *)callerId
                  date:(NSDate *)date
             direction:(FTCallDirection)direction
            isAnswered:(BOOL)isAnswered
{
  if (self = [super init])
  {
    _callerId = callerId;
    _date = date;
    _direction = direction;
    _isAnswered = isAnswered;
  }
  return self;
}

- (FTCallStatus)getCallStatus
{
  if (self.isAnswered) {
    return connected;
  } else if (self.direction == incoming) {
    return missed;
  } else {
    return unknown;
  }
}

- (NSString *)description
{
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"MMMM dd, YYYY"];
  
  return [NSString stringWithFormat:@"%@ - %@ - %@", self.callerId, [dateFormat stringFromDate:self.date], [self getCallStatusString]];
}

- (BOOL)isEqual:(nullable FTCall *)object
{
  return
  [self.callerId isEqual:object.callerId]
  && [[NSCalendar currentCalendar] isDate:self.date inSameDayAsDate:object.date]
  && [self getCallStatus] == [object getCallStatus];
}

#pragma Private Methods

- (NSString *)getCallStatusString
{
  switch ([self getCallStatus]) {
    case connected:
      return @"Connected";
    case missed:
      return @"Missed Call";
    case unknown:
      return @"UNKNOWN";
  }
}

@end

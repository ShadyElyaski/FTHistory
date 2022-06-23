//
//  main.m
//  FTHistory
//
//  Created by Shady Elyaski on 6/22/22.
//

#import <UIKit/UIKit.h>
#import "FTCallHistoryItem.h"
#import "FTCall.h"
#import "FTCallerID.h"

#pragma Test Data

NSArray<FTCall *> *test1Data(void)
{
  return
  @[
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654120800]
            direction:incoming
           isAnswered:YES],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654117200]
            direction:outgoing
           isAnswered:YES],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654113600]
            direction:incoming
           isAnswered:NO],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654110000]
            direction:incoming
           isAnswered:NO],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654106400]
            direction:incoming
           isAnswered:NO],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654102800]
            direction:incoming
           isAnswered:YES],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654016400]
            direction:incoming
           isAnswered:YES],
  ];
}

NSArray<FTCall *> *test2DataWithDifferentPhoneFormats(void)
{
  return
  @[
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408 -555- 1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654120800]
            direction:incoming
           isAnswered:YES],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654117200]
            direction:outgoing
           isAnswered:YES],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-5551234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654113600]
            direction:incoming
           isAnswered:NO],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"40 8- 555- 1234 "]
                 date:[NSDate dateWithTimeIntervalSince1970:1654110000]
            direction:incoming
           isAnswered:NO],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"4085551234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654106400]
            direction:incoming
           isAnswered:NO],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654102800]
            direction:incoming
           isAnswered:YES],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654016400]
            direction:incoming
           isAnswered:YES],
  ];
}

NSArray<FTCall *> *test3Empty(void)
{
  return @[];
}

NSArray<FTCall *> *test4OneItem(void)
{
  return
  @[
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408 -555- 1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654120800]
            direction:incoming
           isAnswered:YES]
  ];
}

NSArray<FTCall *> *test5DataWithCountryCodePhoneFormats(void)
{
  return
  @[
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"+408 -555- 1234" countryCode:@"+1"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654120800]
            direction:incoming
           isAnswered:YES],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"000408555-1234" countryCode:@"001"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654117200]
            direction:outgoing
           isAnswered:YES],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-5551234" countryCode:@"1"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654113600]
            direction:incoming
           isAnswered:NO],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"40 8- 555- 1234 " countryCode:@"+1"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654110000]
            direction:incoming
           isAnswered:NO],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"4085551234" countryCode:@"+2"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654106400]
            direction:incoming
           isAnswered:NO],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654102800]
            direction:incoming
           isAnswered:YES],
    [[FTCall alloc]
     initWithCallerId:[[FTCallerID alloc] initWithPhoneNumber:@"408-555-1234"]
                 date:[NSDate dateWithTimeIntervalSince1970:1654016400]
            direction:incoming
           isAnswered:YES],
  ];
}

#pragma Algorithm

NSArray<FTCallHistoryItem *> *coalesceCall(NSArray<FTCall *> *allCalls)
{
  if (!allCalls.count) {
    return @[];
  }
  NSMutableArray<FTCallHistoryItem *> *coalesceCalls = [NSMutableArray<FTCallHistoryItem *> new];
  int count = 1;
  FTCall *currentCall = allCalls[0];
  for(int x = 1; x < allCalls.count; x++) {
    if ([currentCall isEqual:allCalls[x]]) {
      count++;
    } else {
      [coalesceCalls addObject:
       [[FTCallHistoryItem alloc]
        initWithCall:currentCall
        count:count]];
      // Reset
      currentCall = allCalls[x];
      count = 1;
    }
  } // O(n)
  // Add last item
  [coalesceCalls addObject:
   [[FTCallHistoryItem alloc]
    initWithCall:currentCall
    count:count]];
  return [coalesceCalls copy];
}


int main(int argc, char * argv[]) {
  @autoreleasepool {
    NSLog(@"%@", coalesceCall(test1Data()));
  /* OUTPUT:
   2022-06-22 17:43:25.150013-0700 FTHistory[26256:4980085] (
       "4085551234 - June 01, 2022 - Connected (2)",
       "4085551234 - June 01, 2022 - Missed Call (3)",
       "4085551234 - June 01, 2022 - Connected",
       "4085551234 - May 31, 2022 - Connected"
   )
   */
    NSLog(@"%@", coalesceCall(test2DataWithDifferentPhoneFormats()));
  /* OUTPUT:
   2022-06-22 17:43:25.150013-0700 FTHistory[26256:4980085] (
       "4085551234 - June 01, 2022 - Connected (2)",
       "4085551234 - June 01, 2022 - Missed Call (3)",
       "4085551234 - June 01, 2022 - Connected",
       "4085551234 - May 31, 2022 - Connected"
   )
   */
    NSLog(@"%@", coalesceCall(test3Empty()));
  /* OUTPUT:
   2022-06-22 17:48:45.763611-0700 FTHistory[27788:4992116] (
   )
   */
    NSLog(@"%@", coalesceCall(test4OneItem()));
  /* OUTPUT:
   2022-06-22 17:48:45.763780-0700 FTHistory[27788:4992116] (
       "4085551234 - June 01, 2022 - Connected"
   )
   */
    NSLog(@"%@", coalesceCall(test5DataWithCountryCodePhoneFormats()));
  /* OUTPUT:
   2022-06-22 18:10:43.360070-0700 FTHistory[30906:5022935] (
       "14085551234 - June 01, 2022 - Connected (2)",
       "14085551234 - June 01, 2022 - Missed Call (2)",
       "24085551234 - June 01, 2022 - Missed Call",
       "4085551234 - June 01, 2022 - Connected",
       "4085551234 - May 31, 2022 - Connected"
   )
   */
  }
}

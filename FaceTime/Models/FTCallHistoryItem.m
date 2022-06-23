//
//  FTCall.m
//  FaceTime
//
//  Created by Shady Elyaski on 6/22/22.
//

#import "FTCallHistoryItem.h"
#import "FTCall.h"

@implementation FTCallHistoryItem

-(id)initWithCall:(FTCall *)call
            count:(uint)count
{
  if (self = [super init])
  {
    _call = call;
    _count = count;
  }
  return self;
}


- (NSString *)description
{
  return
  self.count > 1
  ? [NSString stringWithFormat:@"%@ (%d)", self.call, self.count]
  : [self.call description];
}

@end

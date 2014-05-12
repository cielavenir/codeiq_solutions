#if 0 //Objective-C 1.x
#import <Foundation/Foundation.h>
#else
#import <Foundation/NSFileHandle.h>
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSString.h>
#endif

@interface foo: NSObject
{
  id output,pool;
}
- (int)main;
@end

@implementation foo

- (int)main{
  int n;
  pool = [[NSAutoreleasePool alloc] init];
  output = [NSFileHandle fileHandleWithStandardOutput];
  [output writeData:[@"ガールフレンドめっちゃほしい！\n" dataUsingEncoding: NSUTF8StringEncoding]];
  [pool release];
  return 0;
}
@end

//locale not good
int main(){return [[foo alloc] main];}
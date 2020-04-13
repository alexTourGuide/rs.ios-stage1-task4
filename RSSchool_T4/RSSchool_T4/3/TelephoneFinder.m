#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSMutableString *mutString = [[number stringByReplacingOccurrencesOfString:@" " withString:@""] mutableCopy];
    if ([mutString intValue] < 0) {
        return nil;
    }
    NSMutableArray *mutArray = [NSMutableArray array];
    //    long num = [number intValue];
    NSDictionary *neigborNumbers = @{
        @"1": @[@"2", @"4"],
        @"2": @[@"1", @"3", @"5"],
        @"3": @[@"2", @"6"],
        @"4": @[@"1", @"5", @"7"],
        @"5": @[@"2", @"4", @"6", @"8"],
        @"6": @[@"3", @"5", @"9"],
        @"7": @[@"4", @"8"],
        @"8": @[@"5", @"7", @"9", @"0"],
        @"9": @[@"6", @"8"],
        @"0": @[@"8"],
    };
    for (int i = 0; i < [mutString length]; i++) {
        NSString *letter = [mutString substringWithRange:NSMakeRange(i, 1)];
        for (int j = 0; j < [[neigborNumbers valueForKey:letter] count]; j++) {
            NSString *changeString = [[neigborNumbers valueForKey:letter] objectAtIndex:j];
            NSMutableString *mut2String = [NSMutableString stringWithString:mutString];
            [mut2String replaceCharactersInRange:NSMakeRange(i, 1) withString:changeString];
            [mutArray addObject:mut2String];
        }
    }
    return mutArray;
    
    return @[@"0"];
}
@end

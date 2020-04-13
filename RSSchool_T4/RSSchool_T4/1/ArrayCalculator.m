#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:array];
    for (id value in array) {
        if (![value isKindOfClass:[NSNumber class]]) {
            [mutableArray removeObject:value];
        }
    }
    
    if ([mutableArray count] == 0){
        return 0;
    } else if (numberOfItems > [mutableArray count]) {
        numberOfItems = [mutableArray count];
    }
   
    NSMutableArray *arrayCapacityMax = [NSMutableArray arrayWithCapacity:numberOfItems];
    for (int i = 0; i < numberOfItems; i++) {
        NSNumber *max = [mutableArray valueForKeyPath:@"@max.self"];
        NSNumber *min = [mutableArray valueForKeyPath:@"@min.self"];
        if (abs(max.intValue) > abs(min.intValue)) {
            [arrayCapacityMax addObject:max];
            [mutableArray removeObject:max];
        } else if (abs(max.intValue) < abs(min.intValue)) {
            [arrayCapacityMax addObject:min];
            [mutableArray removeObject:min];
            NSNumber *min2 = [mutableArray valueForKeyPath:@"@min.self"];
            NSNumber *max2 = [mutableArray valueForKeyPath:@"@max.self"];
            if (abs(max2.intValue) < abs(min2.intValue)) {
                [arrayCapacityMax addObject:min2];
                [mutableArray removeObject:min2];
                i++;
            } else {
                [arrayCapacityMax removeObject:min];
                [mutableArray addObject:min];
                [arrayCapacityMax addObject:max];
                [mutableArray removeObject:max];
            }
        } else {
            [arrayCapacityMax addObject:max];
            [mutableArray removeObject:max];
        }
    }
    
    int result = 1;
    for (int i = 0; i < [arrayCapacityMax count]; i++) {
        result *= [[arrayCapacityMax objectAtIndex:i] intValue];
    }
    
    return result;
}
@end

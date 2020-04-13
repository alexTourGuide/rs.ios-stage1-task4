#import "SquareDecomposer.h"

@implementation SquareDecomposer

- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    NSNumber *initNumber = [NSNumber numberWithLongLong:[number longLongValue]];
    NSNumber *restSquareOfNumber = [NSNumber numberWithLongLong:[number longLongValue] * [number longLongValue]];
    NSMutableArray *mutArrayWithDecomposedNum = [self decomposer:initNumber rest:restSquareOfNumber];
    
    if (mutArrayWithDecomposedNum == nil) {
        return nil;
    } else {
        [mutArrayWithDecomposedNum removeLastObject];
        return mutArrayWithDecomposedNum;
    }
}

- (NSMutableArray *)decomposer:(NSNumber *)numberToBeDecompoced rest:(NSNumber *)restOfCouting {
    if ([restOfCouting longLongValue] == 0) {
        return [NSMutableArray arrayWithObject:numberToBeDecompoced];
    }
    for (long long j = [numberToBeDecompoced longLongValue] - 1; j > 0; j--) {
        long long squareOfJ = j * j;
        if(([restOfCouting longLongValue] - squareOfJ) >= 0){
            NSNumber *nextNumber = [NSNumber numberWithLongLong:j];
            NSNumber *nextRestingNumber = [NSNumber numberWithLongLong:([restOfCouting longLongValue] - squareOfJ)];
            NSMutableArray *mutDecArrray = [self decomposer:nextNumber rest:nextRestingNumber];
            if (mutDecArrray != nil){
                [mutDecArrray addObject:numberToBeDecompoced];
                return mutDecArrray;
            }
        }
    }
    return nil;
}

@end

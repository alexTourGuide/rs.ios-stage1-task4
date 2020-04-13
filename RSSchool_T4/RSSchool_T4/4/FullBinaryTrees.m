#import "FullBinaryTrees.h"

@interface  FullBinaryTrees (CategoryForGrowingTree)

- (void)growingOfTree:(NSMutableArray *)initialTree withNodes:(int)nodes beforeNodes:(int)totalNodes;

@end

@implementation FullBinaryTrees

- (NSString *)stringForNodeCount:(NSInteger)count {
int countOfNodes = (int)count;
    if (countOfNodes % 2 > 0) {
        NSMutableArray *root = [@[ @[@"0"] ] mutableCopy];
        [self growingOfTree:root withNodes:(int)1 beforeNodes:(int)count];
        return growRageOfTrees(self.arrayOfTrees);
    }
    return @"[]";
}

- (NSMutableArray *)arrayOfTrees
{
    if (!_arrayOfTrees) {
        _arrayOfTrees = [[NSMutableArray alloc] init];
    }
    return _arrayOfTrees;
}

NSString *growOneTree(NSMutableArray *tree){
    NSString *stringTree = @"[";
    NSString *nothingString = @"";
    for (int i = 0; i < tree.count; i++){
        NSArray *floor = tree[i];
        for (int j = 0; j < floor.count; j++){
            NSString *child = floor[j];
            if (i > 0 && [tree[i - 1][j / 2] isEqualToString:@"null"] ){
                continue;
            }
            if ([child isEqualToString:@"0"]) {
                stringTree = [stringTree stringByAppendingString:nothingString];
                nothingString = @"";
                stringTree = [stringTree stringByAppendingString:child];
                stringTree = [stringTree stringByAppendingString:@","];
            } else {
                nothingString = [nothingString stringByAppendingString:child];
                nothingString = [nothingString stringByAppendingString:@","];
            }
        }
    }
    stringTree = [stringTree stringByReplacingCharactersInRange:NSMakeRange(stringTree.length-1,1) withString:@"]"];
    return stringTree;
}

NSString *growRageOfTrees(NSMutableArray *trees){
    NSString *stringRangeOfTrees = @"[";
    for (NSMutableArray *tree in trees){
        stringRangeOfTrees = [stringRangeOfTrees stringByAppendingString:growOneTree(tree)];
        stringRangeOfTrees = [stringRangeOfTrees stringByAppendingString:@","];
    }
    stringRangeOfTrees = [stringRangeOfTrees stringByReplacingCharactersInRange:NSMakeRange(stringRangeOfTrees.length-1,1) withString:@"]"];
    return stringRangeOfTrees;
}

- (void)growingOfTree:(NSMutableArray *)someTree withNodes:(int)nodes beforeNodes:(int)totalNodes {
    if (totalNodes == nodes) {
        [self.arrayOfTrees addObject:someTree];
    } else {
        for(int i = 0; i < someTree.count; i++){
            NSArray *floor = someTree[i];
            for(int j = 0; j < floor.count; j++){
                NSString *child = floor[j];
                if ([child isEqualToString:@"0"] && (i == someTree.count - 1 || ([someTree[i + 1][2 * j] isEqualToString:@"null"]))){
                    NSError *err;
                    NSMutableArray *newTree = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[NSString class], nil] fromData:[NSKeyedArchiver archivedDataWithRootObject:someTree requiringSecureCoding:true error:&err] error:&err];
                    if (i == someTree.count - 1){
                        NSMutableArray *newFloor = [NSMutableArray new];
                        for (int k = 0; k < pow(2,someTree.count); k++){
                            [newFloor addObject:@"null"];
                        }
                        [newTree addObject:newFloor];
                    }
                    newTree[i + 1][2 * j] = @"0";
                    newTree[i + 1][2 * j + 1] = @"0";
                    [self growingOfTree:newTree withNodes:(nodes + 2) beforeNodes:totalNodes];
                }
            }
        }
    }
}
@end

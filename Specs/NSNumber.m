
#import "SpecHelpers.h"
#import "NSNumber+EKStuff.h"

SPEC_BEGIN(NSNumber_Specs)

describe(@"NSNumber-based algorithms", ^{
    describe(@"isEven", ^{
        it(@"should return YES if number is even and NO otherwise", ^{
            int N = 100;

            for (int i = 0; i < N; i++) {
                BOOL isEvenMathematically = [@(i % 2) boolValue] == NO;

                [[theValue([@(i) isEven]) should] equal:@(isEvenMathematically)];

                if ([@(i) isEven]) {
                    [[theValue([@(i + 1) isEven]) should] beNo];
                } else {
                    [[theValue([@(i + 1) isEven]) should] beYes];
                }
            }
        });
    });
    
    describe(@"isPrime", ^{
        it(@"should return YES if number is prime and NO otherwise", ^{
            int N = 100;
            NSArray *primesUnderN = @[@2, @3, @5, @7, @11, @13, @17, @19, @23, @29, @31, @37, @41, @43, @47, @53, @59, @61, @67, @71, @73, @79, @83, @89, @97];
            
            for (int i = 0; i < N; i++) {
                if ([primesUnderN containsObject:@(i)]) {
                    [[theValue([@(i) isPrime]) should] beYes];
                } else {
                    [[theValue([@(i) isPrime]) should] beNo];
                }
            }
        });
    });
    
    describe(@"greatestCommonDivisorWithNumber", ^{
        it(@"should return the greatest common divisior of a number", ^{
            NSMutableArray *gcdArray = [[NSMutableArray alloc] init];
            
            [gcdArray addObject:[NSNumber numberWithInteger:[@9 greatestCommonDivisorWithNumber:12]]]; //GCD: 3
            [gcdArray addObject:[NSNumber numberWithInteger:[@6 greatestCommonDivisorWithNumber:18]]]; //GCD: 6
            [gcdArray addObject:[NSNumber numberWithInteger:[@24 greatestCommonDivisorWithNumber:108]]]; //GCD: 12
            [gcdArray addObject:[NSNumber numberWithInteger:[@15 greatestCommonDivisorWithNumber:75]]]; //GCD: 15
            [gcdArray addObject:[NSNumber numberWithInteger:[@14 greatestCommonDivisorWithNumber:49]]]; //GCD: 7
            [gcdArray addObject:[NSNumber numberWithInteger:[@60 greatestCommonDivisorWithNumber:40]]]; //GCD: 20
            [gcdArray addObject:[NSNumber numberWithInteger:[@3 greatestCommonDivisorWithNumber:5]]]; //GCD: 1
            [gcdArray addObject:[NSNumber numberWithInteger:[@0 greatestCommonDivisorWithNumber:0]]]; //GCD: 0
            
            [[gcdArray should] containObjectsInArray:@[@3, @6, @12, @15, @7, @20, @1, @0]];

        });
        
    
    });
});

SPEC_END

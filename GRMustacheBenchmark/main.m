//
//  main.m
//  GRMustacheBenchmark
//
//  Created by Gwendal Roué on 17/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GRMustache.h"
#include <time.h>

@interface RandomData : NSObject
@end

@implementation RandomData

- (NSString *)description
{
    return @"text";
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return self;
}

@end

@interface RandomTemplateStringProducer: NSObject
- (NSString *)randomTemplateStringWithComplexity:(NSUInteger)complexity allowingText:(BOOL)allowText;
- (NSString *)randomText;
- (NSString *)randomIdentifier;
- (NSString *)randomKeyPath;
- (NSString *)randomVariableTag;
- (NSString *)randomSectionWithInnerTemplateString:(NSString *)innerTemplateString;
@end

@implementation RandomTemplateStringProducer

- (NSString *)randomTemplateStringWithComplexity:(NSUInteger)complexity allowingText:(BOOL)allowText
{
    if (complexity == 0) {
        return @"";
    }
    
    switch (arc4random() % (allowText ? 3 : 2)) {
        case 0:
            return [NSString stringWithFormat:@"%@%@", [self randomVariableTag], [self randomTemplateStringWithComplexity:complexity-1 allowingText:YES]];
        case 1:
            return [self randomSectionWithInnerTemplateString:[self randomTemplateStringWithComplexity:complexity-1 allowingText:YES]];
    }
    
    return [NSString stringWithFormat:@"%@%@", [self randomText], [self randomTemplateStringWithComplexity:complexity-1 allowingText:NO]];
}

- (NSString *)randomText
{
    return @"text";
}

- (NSString *)randomIdentifier
{
    return @"name";
}

- (NSString *)randomKeyPath
{
    switch (arc4random() % 3) {
        case 0:
            return [self randomIdentifier];
            
        case 1:
            return [NSString stringWithFormat:@"%@.%@", [self randomIdentifier], [self randomIdentifier]];
            
        case 2:
            return [NSString stringWithFormat:@"%@.%@.%@", [self randomIdentifier], [self randomIdentifier], [self randomIdentifier]];
    }
    return nil;
}

- (NSString *)randomVariableTag
{
    NSString *keyPath = [self randomKeyPath];
    switch (arc4random() % 4) {
        case 0:
        case 1:
            return [NSString stringWithFormat:@"{{%@}}", keyPath];
            
        case 2:
            return [NSString stringWithFormat:@"{{&%@}}", keyPath];
            
        case 3:
            return [NSString stringWithFormat:@"{{{%@}}}", keyPath];
    }
    return nil;
}

- (NSString *)randomSectionWithInnerTemplateString:(NSString *)innerTemplateString
{
    NSString *keyPath = [self randomKeyPath];
    return [NSString stringWithFormat:@"{{#%@}}%@{{/%@}}", keyPath, innerTemplateString, keyPath];
}
@end


static double cpu_time_elapsed(void(^block)(void))
{
    clock_t start, end;
    start = clock();
    block();
    end = clock();
    return ((double)(end-start))/CLOCKS_PER_SEC;
}

int main (int argc, char * const argv[])
{
    @autoreleasepool {
        char *sampleCountCString = 0;
        char *verbCString = 0;
        char *complexityCString = 0;
        
        while (getopt(argc, argv, "") != -1) ;
        while (optind < argc) {
            if (!sampleCountCString) {
                sampleCountCString = argv[optind++];
            } else if (!verbCString) {
                verbCString = argv[optind++];
            } else {
                complexityCString = argv[optind++];
                break;
            }
        }
        
        NSUInteger sampleCount = 0; sscanf(sampleCountCString, "%ld", &sampleCount);
        NSString *verb = [NSString stringWithCString:verbCString encoding:NSUTF8StringEncoding];
        NSUInteger complexity = 0; sscanf(complexityCString, "%ld", &complexity);
        RandomTemplateStringProducer *producer = [[RandomTemplateStringProducer alloc] init];
        
        if ([verb isEqualToString:@"parse"]) {
            // outputs parsing time
            double time = 0;
            for (NSUInteger i=0; i<sampleCount; i++) {
                @autoreleasepool {
                    NSString *templateString = [producer randomTemplateStringWithComplexity:complexity allowingText:YES];
                    time += cpu_time_elapsed(^{
#if GRMUSTACHE_MAJOR_VERSION < 2 && GRMUSTACHE_MINOR_VERSION < 11
                        [GRMustacheTemplate parseString:templateString error:NULL];
#else
                        [GRMustacheTemplate templateFromString:templateString error:NULL];
#endif
                    });
                }
            }
            printf("%g\n", time/sampleCount);
            
        } else if ([verb isEqualToString:@"render"]) {
            // outputs rendering time
            
            id randomData = [RandomData new];
            double time = 0;
            for (NSUInteger i=0; i<sampleCount; i++) {
                @autoreleasepool {
                    NSString *templateString = [producer randomTemplateStringWithComplexity:complexity allowingText:YES];
#if GRMUSTACHE_MAJOR_VERSION < 2 && GRMUSTACHE_MINOR_VERSION < 11
                    GRMustacheTemplate *template = [GRMustacheTemplate parseString:templateString error:NULL];
#else
                    GRMustacheTemplate *template = [GRMustacheTemplate templateFromString:templateString error:NULL];
#endif
                    time += cpu_time_elapsed(^{
#if GRMUSTACHE_MAJOR_VERSION < 6
                        [template renderObject:randomData];
#else
                        [template renderObject:randomData error:NULL];
#endif
                    });
                }
            }
            printf("%g\n", time/sampleCount);
            
        } else if ([verb isEqualToString:@"combined"]) {
            // outputs parsing + rendering time
            
            double time = 0;
            id randomData = [RandomData new];
            for (NSUInteger i=0; i<sampleCount; i++) {
                @autoreleasepool {
                    NSString *templateString = [producer randomTemplateStringWithComplexity:complexity allowingText:YES];
                    time += cpu_time_elapsed(^{
#if GRMUSTACHE_MAJOR_VERSION < 6
                        [GRMustacheTemplate renderObject:randomData fromString:templateString error:NULL];
#else
                        [[GRMustacheTemplate templateFromString:templateString error:NULL] renderObject:randomData error:NULL];
#endif
                    });
                }
            }
            printf("%g\n", time/sampleCount);
            
        }
        
    }
    return 0;
}



//
//  main.m
//  GRMustacheBenchmark
//
//  Created by Gwendal Roué on 17/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GRMustache.h"
#include <time.h>

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
        char *scenarioPathCString = 0;
        
        while (getopt(argc, argv, "") != -1) ;
        while (optind < argc) {
            if (!sampleCountCString) {
                sampleCountCString = argv[optind++];
            } else if (!verbCString) {
                verbCString = argv[optind++];
            } else {
                scenarioPathCString = argv[optind++];
                break;
            }
        }
        
        NSUInteger sampleCount = 0; sscanf(sampleCountCString, "%d", &sampleCount);
        NSString *verb = [NSString stringWithCString:verbCString encoding:NSUTF8StringEncoding];
        NSString *scenarioPath = [NSString stringWithCString:scenarioPathCString encoding:NSUTF8StringEncoding];
        
        NSString *scenarioTemplatePath = [scenarioPath stringByAppendingPathExtension:@"mustache"];
        
        if ([verb isEqualToString:@"parse"]) {
            // outputs parsing time
            NSString *templateString = [NSString stringWithContentsOfFile:scenarioTemplatePath encoding:NSUTF8StringEncoding error:NULL];
            double time = cpu_time_elapsed(^{
                for (NSUInteger i=0; i<sampleCount; i++) {
#if GRMUSTACHE_MAJOR_VERSION < 2 && GRMUSTACHE_MINOR_VERSION < 11
                    [GRMustacheTemplate parseString:templateString error:NULL];
#else
                    [GRMustacheTemplate templateFromString:templateString error:NULL];
#endif
                }
            });
            printf("%g\n", time/sampleCount);
            
        } else if ([verb isEqualToString:@"render"]) {
            // outputs rendering time
            
#if GRMUSTACHE_MAJOR_VERSION < 2 && GRMUSTACHE_MINOR_VERSION < 11
            GRMustacheTemplate *template = [GRMustacheTemplate parseContentsOfFile:scenarioTemplatePath error:NULL];
#else
            GRMustacheTemplate *template = [GRMustacheTemplate templateFromContentsOfFile:scenarioTemplatePath error:NULL];
#endif
            NSString *dictionaryTemplatePath = [scenarioPath stringByAppendingPathExtension:@"plist"];
            NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:dictionaryTemplatePath];
            double time = cpu_time_elapsed(^{
                for (NSUInteger i=0; i<sampleCount; i++) {
                    [template renderObject:dictionary];
                }
            });
            printf("%g\n", time/sampleCount);
            
        } else if ([verb isEqualToString:@"combined"]) {
            // outputs parsing + rendering time
            
            NSString *templateString = [NSString stringWithContentsOfFile:scenarioTemplatePath encoding:NSUTF8StringEncoding error:NULL];
            NSString *dictionaryTemplatePath = [scenarioPath stringByAppendingPathExtension:@"plist"];
            NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:dictionaryTemplatePath];
            double time = cpu_time_elapsed(^{
                for (NSUInteger i=0; i<sampleCount; i++) {
                    [GRMustacheTemplate renderObject:dictionary fromString:templateString error:NULL];
                }
            });
            printf("%g\n", time/sampleCount);
            
        } else if ([verb isEqualToString:@"check"]) {
            // outputs template rendering
            
#if GRMUSTACHE_MAJOR_VERSION < 2 && GRMUSTACHE_MINOR_VERSION < 11
            GRMustacheTemplate *template = [GRMustacheTemplate parseContentsOfFile:scenarioTemplatePath error:NULL];
#else
            GRMustacheTemplate *template = [GRMustacheTemplate templateFromContentsOfFile:scenarioTemplatePath error:NULL];
#endif
            NSString *dictionaryTemplatePath = [scenarioPath stringByAppendingPathExtension:@"plist"];
            NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:dictionaryTemplatePath];
            printf("%s\n", [[template renderObject:dictionary] cStringUsingEncoding:NSUTF8StringEncoding]);
            
        }
        
    }
    return 0;
}



//
//  main.m
//  GRMustacheBenchmark
//
//  Created by Gwendal Roué on 17/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GRMustache.h"
#include <sys/time.h>
#include <sys/resource.h>

static double get_time() {
    struct timeval t;
    struct timezone tzp;
    gettimeofday(&t, &tzp);
    return t.tv_sec + t.tv_usec*1e-6;
}

static double time_elapsed(void(^block)(void))
{
    double start_time = get_time();
    block();
    return get_time()-start_time;
}

int main (int argc, char * const argv[])
{
    @autoreleasepool {
        char *countCString = 0;
        char *verbCString = 0;
        char *scenarioPathCString = 0;
        
        while (getopt(argc, argv, "") != -1) ;
        while (optind < argc) {
            if (!countCString) {
                countCString = argv[optind++];
            } else if (!verbCString) {
                verbCString = argv[optind++];
            } else {
                scenarioPathCString = argv[optind++];
                break;
            }
        }
        
        NSUInteger count = 0; sscanf(countCString, "%d", &count);
        NSString *verb = [NSString stringWithCString:verbCString encoding:NSUTF8StringEncoding];
        NSString *scenarioPath = [NSString stringWithCString:scenarioPathCString encoding:NSUTF8StringEncoding];
        
        NSString *scenarioTemplatePath = [scenarioPath stringByAppendingPathExtension:@"mustache"];
        
        if ([verb isEqualToString:@"parse"]) {
            // outputs parsing time
            NSString *templateString = [NSString stringWithContentsOfFile:scenarioTemplatePath encoding:NSUTF8StringEncoding error:NULL];
            double time = time_elapsed(^{
                for (NSUInteger i=0; i<count; i++) {
                    [GRMustacheTemplate parseString:templateString error:NULL];
                }
            });
            printf("%f\n", time);
            
        } else if ([verb isEqualToString:@"render"]) {
            // outputs rendering time
            
            GRMustacheTemplate *template = [GRMustacheTemplate parseContentsOfFile:scenarioTemplatePath error:NULL];
            NSString *dictionaryTemplatePath = [scenarioPath stringByAppendingPathExtension:@"plist"];
            NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:dictionaryTemplatePath];
            double time = time_elapsed(^{
                for (NSUInteger i=0; i<count; i++) {
                    [template renderObject:dictionary];
                }
            });
            printf("%f\n", time);
            
        } else if ([verb isEqualToString:@"combined"]) {
            // outputs parsing + rendering time
            
            NSString *templateString = [NSString stringWithContentsOfFile:scenarioTemplatePath encoding:NSUTF8StringEncoding error:NULL];
            NSString *dictionaryTemplatePath = [scenarioPath stringByAppendingPathExtension:@"plist"];
            NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:dictionaryTemplatePath];
            double time = time_elapsed(^{
                for (NSUInteger i=0; i<count; i++) {
                    [GRMustacheTemplate renderObject:dictionary fromString:templateString error:NULL];
                }
            });
            printf("%f\n", time);
            
        } else if ([verb isEqualToString:@"check"]) {
            // outputs template rendering
            
            GRMustacheTemplate *template = [GRMustacheTemplate parseContentsOfFile:scenarioTemplatePath error:NULL];
            NSString *dictionaryTemplatePath = [scenarioPath stringByAppendingPathExtension:@"plist"];
            NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:dictionaryTemplatePath];
            printf("%s\n", [[template renderObject:dictionary] cStringUsingEncoding:NSUTF8StringEncoding]);
            
        }
        
    }
    return 0;
}



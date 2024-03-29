//
//  Questions.m
//  Shy
//
//  Created by Samuel B Heather on 01/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "Questions.h"
#import "Question.h"

@implementation Questions {
    NSMutableData *_downloadedData;
}

@synthesize questions, liveData;

- (id)init {
    self = [super init];
    questions = [[NSMutableArray alloc] init];
    return self;
}

-(void)loadQuestions {
    liveData = FALSE;
    [self downloadItems];
}

-(void)processItems:(NSMutableArray*)completeDownloadedData {
    questions = completeDownloadedData;
}

-(Question *)getQuestionWithIndex:(int)index {
    if (liveData) {
        return [questions objectAtIndex:index];
    }
    else {
        return NULL;
    }
}

-(NSMutableArray *)getQuestionsFromCategory:(NSString *)category {
    NSMutableArray *toReturn = [[NSMutableArray alloc] init];
    for (int i = 0; i < [questions count]; i++) {
        
        BOOL identicalStringFound = NO;
        for (NSString *someString in [[self getQuestionWithIndex:i] splitExternalKeywords]) {
            if ([someString isEqualToString:category]) {
                identicalStringFound = YES;
                break;
            }
        }
        
        if (identicalStringFound) {
            [toReturn addObject:[self getQuestionWithIndex:i]];
        }
    }
    return toReturn;
}

-(BOOL)isLiveData {
    if ([questions count] > 0 && liveData == TRUE) {
        return TRUE;
    }
    else {
        return FALSE;
    }
}

-(void)addQuestion:(Question *)newQuestion {
    [questions addObject:newQuestion];
}

////////

- (void)downloadItems
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://shy.heather.sh/get.php"];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_locations = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSLog(@"A question was downloaded and is been processed");
        
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new question object and set its props to JsonElement properties
        Question *newQuestion = [[Question alloc] initWithUid:[jsonElement[@"id"] intValue] question:jsonElement[@"question"] answer:jsonElement[@"answer"] internalKeywords:jsonElement[@"internalKeywords"] externalKeywords:jsonElement[@"externalKeywords"] targets:jsonElement[@"targets"] ageRange:jsonElement[@"ages"] numberOfVotes:[jsonElement[@"votes"] intValue]];
        
        // Add this question to the locations array
        [_locations addObject:newQuestion];
    }
    
//    // Ready to notify delegate that data is ready and pass back items
//    if (self.delegate)
//    {
//        [self.delegate itemsDownloaded:_locations];
//    }
    
    [self processItems:_locations];
    
    liveData = TRUE;
}

-(int)numberOfQuestions {
    return (int)[questions count];
}

@end

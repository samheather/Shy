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

@synthesize questions;

- (id)init {
    self = [super init];
    return self;
}

-(BOOL)loadQuestions {
    return TRUE;
}

////////

- (void)downloadItems
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://gtvinyl.com/service.php"];
    
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
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new question object and set its props to JsonElement properties
        Question *newQuestion = [[Question alloc] initWithUid:[jsonElement[@"id"] intValue] question:jsonElement[@"question"] answer:jsonElement[@"answer"] keywords:jsonElement[@"keywords"] targets:jsonElement[@"targets"] ageRange:jsonElement[@"ages"] numberOfVotes:[jsonElement[@"votes"] intValue]];
        
        // Add this question to the locations array
        [_locations addObject:newQuestion];
    }
    
//    // Ready to notify delegate that data is ready and pass back items
//    if (self.delegate)
//    {
//        [self.delegate itemsDownloaded:_locations];
//    }
    
    questions = _locations;
}

@end

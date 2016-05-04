//
//  InputCollector.m
//  W1D2-Contact List
//
//  Created by Taylor Benna on 2016-05-03.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString {
    char input[255];
    
    
    NSLog(@"%@", promptString); // prompt
    fgets(input, 255, stdin);
    strtok(input, "\n");
    NSString *usableInput = [NSString stringWithFormat:@"%s", input];
    return usableInput;
}

@end

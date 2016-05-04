//
//  main.m
//  W1D2-Contact List
//
//  Created by Taylor Benna on 2016-05-03.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ContactList *contacts = [[ContactList alloc] init];
        
        //Hard coded for ease
        Contact *con1 = [[Contact alloc ] init ];
        con1.name = @"Taylor Benna";
        con1.email = @"taylor@benna.ca";
        con1.phoneNum = [[NSMutableArray alloc] init];
        con1.phoneLabel = [[NSMutableArray alloc] init];
        [con1.phoneNum addObject:@"6048399281"];
        [con1.phoneLabel addObject:@"iPhone"];
        [con1.phoneNum addObject:@"6049429223"];
        [con1.phoneLabel addObject:@"Home"];
        [contacts addContact:con1];
        
        Contact *con2 = [[Contact alloc ] init ];
        con2.name = @"Danielle Neeson";
        con2.email = @"danielleneeson@live.ca";
        con2.phoneNum = [[NSMutableArray alloc] init];
        con2.phoneLabel = [[NSMutableArray alloc] init];
        [con2.phoneNum addObject:@"7782270535"];
        [con2.phoneLabel addObject:@"iPhone"];
        [contacts addContact:con2];
    
        Contact *con3 = [[Contact alloc ] init ];
        con3.name = @"Paul Audette";
        con3.email = @"paulraudette@gmail.com";
        con3.phoneNum = [[NSMutableArray alloc] init];
        con3.phoneLabel = [[NSMutableArray alloc] init];
        [con3.phoneNum addObject:@"6043537595"];
        [con3.phoneLabel addObject:@"Mobile"];
        [contacts addContact:con3];
        /////////
        
        
        NSMutableArray *history = [[NSMutableArray alloc] init];
        [history addObject:@"EMPTY"];
        [history addObject:@"EMPTY"];
        [history addObject:@"EMPTY"];
        
        BOOL quit = NO;
        do {
            NSLog(@"----------------------");
            NSLog(@"What would you like to do?");
            NSLog(@"NEW - New Contact");
            NSLog(@"LIST - List all Contacts");
            NSLog(@"SHOW - Show a contact by number");
            NSLog(@"FIND - Search the contact list");
            NSLog(@"HISTORY - Show the previous 3 commands");
            NSLog(@"QUIT - Quit the application");
            NSLog(@"----------------------");
            
            InputCollector *input = [[InputCollector alloc] init];
            NSString *choice = [[input inputForPrompt:@"Choice: "] uppercaseString];
            
            [history addObject:choice];
            
            //Exit
            if ([choice isEqualToString:@"QUIT"]) {
                NSLog(@"Ok, Goodbye then!");
                quit = YES;
            }
            //New
            else if ([choice isEqualToString:@"NEW"]) {
                Contact *con = [[Contact alloc] init];
                con.phoneNum = [[NSMutableArray alloc] init];
                con.phoneLabel = [[NSMutableArray alloc] init];
                
                con.email = [input inputForPrompt:@"New Contact's E-Mail: "];
                if (![contacts checkForDouble:con.email]){
                    con.name = [input inputForPrompt:@"New Contact's Full Name: "];
                    BOOL more = YES;
                    do {
                        [con.phoneNum addObject:[input inputForPrompt:@"Phone Number: "]];
                        [con.phoneLabel addObject:[input inputForPrompt:@"What kind of Number was that?: "]];
                        more = [[input inputForPrompt:@"Do you have another phone to add?: "] boolValue];
                        
                    }while (more == YES);
                    [contacts addContact:con];
                } else {
                    NSLog(@"This email is already in use");
                }
                
            }
            //List
            else if ([choice isEqualToString:@"LIST"]) {
                [contacts printList];
            }
            //Show
            else if ([choice isEqualToString:@"SHOW"]) {
                NSString *chosenIndex = [input inputForPrompt:@"Which Index?: "];
                [contacts showContactAtIndex:chosenIndex];
            }
            //Find
            else if ([choice isEqualToString:@"FIND"]) {
                NSString *searchString = [input inputForPrompt:@"What are we searching for?: "];
                [contacts showAllContactsWith:searchString];
            }
            //History
            else if ([choice isEqualToString:@"HISTORY"]) {
                NSUInteger toCount = [history count];
                for (NSUInteger i = (toCount - 4); i < (toCount - 1); i++){
                    NSLog(@"%@", history[i]);
                }
            }
            //Incompatible input
            else {
                NSLog(@"Choose a real option");
            }
            
        }while(quit == NO);
        
    }
    return 0;
}

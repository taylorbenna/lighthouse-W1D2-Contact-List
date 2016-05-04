//
//  ContactList.m
//  W1D2-Contact List
//
//  Created by Taylor Benna on 2016-05-03.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

-(id) init {
    self = [super init];
    
    self.contacts = [[NSMutableArray alloc] init];
    
    return self;
}

-(void)displayInfo:(Contact *)con {
    NSLog(@"NAME: %@", con.name);
    NSLog(@"EMAIL: %@", con.email);
    for (int x = 0; x < [con.phoneNum count]; x++) {
        NSLog(@"-- %@ | %@", con.phoneLabel[x], con.phoneNum[x]);
    }
    NSLog(@"----------------------");
}

-(void)addContact:(Contact *)newContact {
    [self.contacts addObject:newContact];
}

-(void)printList {
    int i = 0;
    for (Contact *con in self.contacts) {
        NSLog(@"Information for Customer: %d", i);
        [self displayInfo:con];
        i++;
        NSLog(@"----------------------");
    }
}

-(void)showContactAtIndex:(NSString *)stringIndex {
    NSInteger index = [stringIndex integerValue];
    if (index < [self.contacts count]){
        NSLog(@"----------------------");
        NSLog(@"Information for Customer: %ld", (long)index);
        Contact *con = self.contacts[index];
        [self displayInfo:con];
    } else {
        NSLog(@"This Contact does not exist");
    }
    
}

-(void)showAllContactsWith:(NSString *)searchString {
    int found = 0;
    for (Contact *con in self.contacts) {
        if ([[con.name lowercaseString] containsString:[searchString lowercaseString]]) {
            NSLog(@"----------------------");
            [self displayInfo:con];
            found++;
        } else if([[con.email lowercaseString] containsString:[searchString lowercaseString]]) {
            NSLog(@"----------------------");
            [self displayInfo:con];
            found++;
        }
    }
    if (found == 0) {
        NSLog(@"No results found with '%@' in them, please try again", searchString);
    }
    else {
        NSLog(@"%d results found with '%@' in them", found, searchString);
    }
}

-(BOOL)checkForDouble:(NSString *)email {
    BOOL foundDup = NO;
    for (Contact *con in self.contacts) {
        if ([[con.email lowercaseString] isEqualToString:[email lowercaseString]]) {
            foundDup = YES;
            break;
        }
    }
    return foundDup;
}



@end

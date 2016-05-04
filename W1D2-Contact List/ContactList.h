//
//  ContactList.h
//  W1D2-Contact List
//
//  Created by Taylor Benna on 2016-05-03.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property (nonatomic) NSMutableArray *contacts;

-(void)addContact:(Contact *)newContact;
-(void)printList;
-(void)showContactAtIndex:(NSString *)stringIndex;
-(void)showAllContactsWith:(NSString *)searchString;
-(BOOL)checkForDouble:(NSString *)email;
-(void)displayInfo:(Contact *)con;

@end

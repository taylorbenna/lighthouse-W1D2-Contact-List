//
//  Contact.h
//  W1D2-Contact List
//
//  Created by Taylor Benna on 2016-05-03.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *email;
@property (nonatomic) NSMutableArray *phoneNum;
@property (nonatomic) NSMutableArray *phoneLabel;

@end

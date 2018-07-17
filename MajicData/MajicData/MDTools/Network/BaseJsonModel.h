//
//  BaseJsonModel.h
//  J-nife
//
//  Created by Tommy on 2017/3/15.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import <JSONModel/JSONModel.h>

typedef void (^success)(NSDictionary *resultObject);
typedef void (^failure)(NSError  *requestErr);


@interface BaseJsonModel : JSONModel

@property (nonatomic, strong) NSNumber<Optional> *success;
@property (nonatomic, strong) NSString<Optional> *code;
@property (nonatomic, strong) NSString<Optional> *vit_description;
@property (nonatomic, strong) NSNumber<Optional> *timestamp;
@property (nonatomic, strong) NSString<Optional> *message;

@end

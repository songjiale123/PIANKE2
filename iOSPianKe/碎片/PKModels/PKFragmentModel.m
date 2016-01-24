//
//	PKFragmentModel.m
//
//	Create by c ma on 23/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKFragmentModel.h"

@interface PKFragmentModel ()
@end
@implementation PKFragmentModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
		self.data = [[PKData alloc] initWithDictionary:dictionary[@"data"]];
	}

	if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
		self.result = [dictionary[@"result"] integerValue];
	}

	return self;
}
@end





@implementation PKCounterList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"comment"] isKindOfClass:[NSNull class]]){
        self.comment = [dictionary[@"comment"] integerValue];
    }
    
    if(![dictionary[@"like"] isKindOfClass:[NSNull class]]){
        self.like = [dictionary[@"like"] integerValue];
    }
    
    return self;
}
@end





@implementation PKData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
        NSArray * listDictionaries = dictionary[@"list"];
        NSMutableArray * listItems = [NSMutableArray array];
        for(NSDictionary * listDictionary in listDictionaries){
            PKList * listItem = [[PKList alloc] initWithDictionary:listDictionary];
            [listItems addObject:listItem];
        }
        self.list = listItems;
    }
    if(![dictionary[@"tag_offical"] isKindOfClass:[NSNull class]]){
        self.tagOffical = dictionary[@"tag_offical"];
    }
    if(![dictionary[@"total"] isKindOfClass:[NSNull class]]){
        self.total = [dictionary[@"total"] integerValue];
    }
    
    return self;
}
@end





@implementation PKList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"addtime"] isKindOfClass:[NSNull class]]){
        self.addtime = [dictionary[@"addtime"] integerValue];
    }
    
    if(![dictionary[@"addtime_f"] isKindOfClass:[NSNull class]]){
        self.addtimeF = dictionary[@"addtime_f"];
    }
    if(![dictionary[@"content"] isKindOfClass:[NSNull class]]){
        self.content = dictionary[@"content"];
    }
    if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
        self.contentid = dictionary[@"contentid"];
    }
    if(![dictionary[@"counterList"] isKindOfClass:[NSNull class]]){
        self.counterList = [[PKCounterList alloc] initWithDictionary:dictionary[@"counterList"]];
    }
    
    if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
        self.coverimg = dictionary[@"coverimg"];
    }
    if(![dictionary[@"coverimg_wh"] isKindOfClass:[NSNull class]]){
        self.coverimgWh = dictionary[@"coverimg_wh"];
    }
    if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
        self.islike = [dictionary[@"islike"] boolValue];
    }
    
    if(![dictionary[@"songid"] isKindOfClass:[NSNull class]]){
        self.songid = dictionary[@"songid"];
    }
    if(![dictionary[@"tag_info"] isKindOfClass:[NSNull class]]){
        self.tagInfo = [[PKTagInfo alloc] initWithDictionary:dictionary[@"tag_info"]];
    }
    
    if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
        self.userinfo = [[PKUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
    }
    
    return self;
}
@end







@implementation PKTagInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"count"] isKindOfClass:[NSNull class]]){
        self.count = [dictionary[@"count"] integerValue];
    }
    
    if(![dictionary[@"offical"] isKindOfClass:[NSNull class]]){
        self.offical = [dictionary[@"offical"] boolValue];
    }
    
    if(![dictionary[@"tag"] isKindOfClass:[NSNull class]]){
        self.tag = dictionary[@"tag"];
    }	
    return self;
}
@end




@implementation PKUserinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"icon"] isKindOfClass:[NSNull class]]){
        self.icon = dictionary[@"icon"];
    }
    if(![dictionary[@"uid"] isKindOfClass:[NSNull class]]){
        self.uid = [dictionary[@"uid"] integerValue];
    }
    
    if(![dictionary[@"uname"] isKindOfClass:[NSNull class]]){
        self.uname = dictionary[@"uname"];
    }	
    return self;
}
@end
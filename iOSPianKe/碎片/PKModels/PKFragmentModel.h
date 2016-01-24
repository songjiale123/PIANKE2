//
//	PKFragmentModel.h
//
//	Create by c ma on 23/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>









@interface PKCounterList : NSObject

@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger like;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end


@interface PKData : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, strong) NSObject * tagOffical;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end


@interface PKTagInfo : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL offical;
@property (nonatomic, strong) NSString * tag;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end




@interface PKUserinfo : NSObject

@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * uname;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end




@interface PKList : NSObject

@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) PKCounterList * counterList;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * coverimgWh;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) PKTagInfo * tagInfo;
@property (nonatomic, strong) PKUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end





@interface PKFragmentModel : NSObject

@property (nonatomic, strong) PKData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;




@end
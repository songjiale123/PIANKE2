//
//	PKGoodModel.h
//
//	Create by c ma on 23/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>



@interface Data : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end




@interface List : NSObject

@property (nonatomic, strong) NSString * buyurl;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end




@interface PKGoodModel : NSObject

@property (nonatomic, strong) Data * data;
@property (nonatomic, assign) NSInteger result;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
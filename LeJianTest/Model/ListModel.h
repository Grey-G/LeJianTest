#import <UIKit/UIKit.h>

@interface ListModel : NSObject

@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * styleCount;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
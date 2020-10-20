//
//	ListModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ListModel.h"

NSString *const kListModelImage = @"image";
NSString *const kListModelName = @"name";
NSString *const kListModelPrice = @"price";
NSString *const kListModelStyleCount = @"styleCount";

@interface ListModel ()
@end
@implementation ListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kListModelImage] isKindOfClass:[NSNull class]]){
		self.image = dictionary[kListModelImage];
	}	
	if(![dictionary[kListModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kListModelName];
	}	
	if(![dictionary[kListModelPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kListModelPrice];
	}	
	if(![dictionary[kListModelStyleCount] isKindOfClass:[NSNull class]]){
		self.styleCount = dictionary[kListModelStyleCount];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.image != nil){
		dictionary[kListModelImage] = self.image;
	}
	if(self.name != nil){
		dictionary[kListModelName] = self.name;
	}
	if(self.price != nil){
		dictionary[kListModelPrice] = self.price;
	}
	if(self.styleCount != nil){
		dictionary[kListModelStyleCount] = self.styleCount;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.image != nil){
		[aCoder encodeObject:self.image forKey:kListModelImage];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kListModelName];
	}
	if(self.price != nil){
		[aCoder encodeObject:self.price forKey:kListModelPrice];
	}
	if(self.styleCount != nil){
		[aCoder encodeObject:self.styleCount forKey:kListModelStyleCount];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.image = [aDecoder decodeObjectForKey:kListModelImage];
	self.name = [aDecoder decodeObjectForKey:kListModelName];
	self.price = [aDecoder decodeObjectForKey:kListModelPrice];
	self.styleCount = [aDecoder decodeObjectForKey:kListModelStyleCount];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ListModel *copy = [ListModel new];

	copy.image = [self.image copy];
	copy.name = [self.name copy];
	copy.price = [self.price copy];
	copy.styleCount = [self.styleCount copy];

	return copy;
}
@end
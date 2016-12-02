//
//  CYNPhotoSearchController.h
//  Morphcast
//
//  Created by Marco Rossi on 01/12/16.
//  Copyright © 2016 CYNNY INC. All rights reserved.
//

#import "DZNPhotoPickerControllerConstants.h"

@interface CYNPhotoSearchController : NSObject

/** The photo services to be supported by the controller. Default are 500px & Flickr. */
@property (nonatomic) DZNPhotoPickerControllerServices supportedServices;
/** YES if the user is allowed to edit a selected image. Default is NO. */
@property (nonatomic) BOOL allowsEditing;
/** An optional string term for auto-starting the photo search, as soon as the picker is presented. */
@property (nonatomic, copy) NSString *initialSearchTerm;
/** YES if auto-completion search is available while the user is typing on the search bar. This data uses Flickr's tag search API. Default is YES. */
@property (nonatomic, assign) BOOL allowAutoCompletedSearch;
/** YES if images should load automatically once reaching the bottom of the scroll view. Default is NO. */
@property (nonatomic, assign) BOOL infiniteScrollingEnabled;

@property (nonatomic) UIColor *barTintColor;

/**
 Returns an array of the available media types for the specified service type.
 @discussion Only kUTTypeImage will be returned for now. Maybe on a future, this library could have video and audio search support.
 
 @param services The specified supported services.
 @return An array whose elements identify the available media types for the supported services.
 */
+ (NSArray *)availableMediaTypesForSupportedServices:(DZNPhotoPickerControllerServices)services;

/**
 Registers a FREE (or demo) specified photo service.
 @discussion This is a convenience method of +registerService:consumerKey:consumerSecret:subscription:
 */
+ (void)registerFreeService:(DZNPhotoPickerControllerServices)service consumerKey:(NSString *)key consumerSecret:(NSString *)secret;

/**
 Registers a specified photo service.
 @discussion You must create an app for every photo service you'd like to use, and generate a consumer key and secret from their sites. Run this method on when initializing the view controller that will use DZNPhotoPickerController, typically in the +initialize method.
 
 @param service The photo service to register (i.e. 500px, Flickr, Google Images, etc.)
 @param key The API consumer key.
 @param secret The API consumer secret token.
 @param subscription The photo service subscription type (i.e. Free & Paid). This param only affects Google Images API for now.
 */
+ (void)registerService:(DZNPhotoPickerControllerServices)service consumerKey:(NSString *)key consumerSecret:(NSString *)secret subscription:(DZNPhotoPickerControllerSubscription)subscription;

@end

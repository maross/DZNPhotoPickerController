//
//  CYNPhotoSearchController.m
//  Morphcast
//
//  Created by Marco Rossi on 01/12/16.
//  Copyright © 2016 CYNNY INC. All rights reserved.
//

#import "CYNPhotoSearchController.h"
#import "CYNPhotoDisplayViewController.h"
#import "DZNPhotoServiceFactory.h"

// 500px
#define k500pxConsumerKey               @"9sUVdra51AYawcQwQjFaQA7ueUqpaXLEZQJT7Pzy"
#define k500pxConsumerSecret            @"CmmZmHfSu1xi9BfVq4cS5RcAAhnR9UylGzPJQjqc"

// Flickr
#define kFlickrConsumerKey              @"8c96746e0818c4ceb119c13c1eb1b05e"
#define kFlickrConsumerSecret           @"f35bf89a60e411a5"

// Instagram
#define kInstagramConsumerKey           @"16759bba4b7e4831b80bf3412e7dcb16"
#define kInstagramConsumerSecret        @"701c5a99144a401c8285b0c9df999509"

// Google Images
#define kGoogleImagesConsumerKey        @"AIzaSyC3yp7wxqA3NpWS6nIRbQnccfTm9-ALM1I"
#define kGoogleImagesSearchEngineID     @"007154800332161620331:ukenhf_ga7a"        //cx

// Bing Images
#define kBingImagesAccountKey           @"9V3Rg6PgTrQno6t7pKpT9dLppEaVwVyucUwmHXZXlUo" //5000 request per month (free account)

// Giphy
#define kGiphyConsumerKey               @"dc6zaTOxFJmzC"

@interface CYNPhotoSearchController ()

@end

@implementation CYNPhotoSearchController

+ (void)initialize
{
    [CYNPhotoSearchController registerFreeService:DZNPhotoPickerControllerService500px
                                      consumerKey:k500pxConsumerKey
                                   consumerSecret:k500pxConsumerSecret];
    
    [CYNPhotoSearchController registerFreeService:DZNPhotoPickerControllerServiceFlickr
                                      consumerKey:kFlickrConsumerKey
                                   consumerSecret:kFlickrConsumerSecret];
    
    [CYNPhotoSearchController registerFreeService:DZNPhotoPickerControllerServiceInstagram
                                      consumerKey:kInstagramConsumerKey
                                   consumerSecret:kInstagramConsumerSecret];
    
    [CYNPhotoSearchController registerFreeService:DZNPhotoPickerControllerServiceGoogleImages
                                      consumerKey:kGoogleImagesConsumerKey
                                   consumerSecret:kGoogleImagesSearchEngineID];
    
    //Bing does not require a secret. Rather just an "Account Key"
    [CYNPhotoSearchController registerFreeService:DZNPhotoPickerControllerServiceBingImages
                                      consumerKey:kBingImagesAccountKey
                                   consumerSecret:nil];
    
    [CYNPhotoSearchController registerFreeService:DZNPhotoPickerControllerServiceGiphy
                                      consumerKey:kGiphyConsumerKey
                                   consumerSecret:nil];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.allowsEditing = NO;
        self.allowAutoCompletedSearch = YES;
        self.infiniteScrollingEnabled = YES;
        self.initialSearchTerm = @"";
        self.supportedServices = DZNPhotoPickerControllerService500px | DZNPhotoPickerControllerServiceFlickr |
                                 DZNPhotoPickerControllerServiceGoogleImages | DZNPhotoPickerControllerServiceGiphy;
        
    }
    return self;
}

#pragma mark - Getter methods

+ (NSArray *)availableMediaTypesForSupportedServices:(DZNPhotoPickerControllerServices)services
{
    return @[(NSString *)kUTTypeImage];
}

+ (void)registerFreeService:(DZNPhotoPickerControllerServices)service consumerKey:(NSString *)key consumerSecret:(NSString *)secret
{
    [self registerService:service consumerKey:key consumerSecret:secret subscription:DZNPhotoPickerControllerSubscriptionFree];
}

+ (void)registerService:(DZNPhotoPickerControllerServices)service consumerKey:(NSString *)key consumerSecret:(NSString *)secret subscription:(DZNPhotoPickerControllerSubscription)subscription
{
    [DZNPhotoServiceFactory setConsumerKey:key consumerSecret:secret service:service subscription:subscription];
}

@end

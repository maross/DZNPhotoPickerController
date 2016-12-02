//
//  CYNPhotoDisplayViewController.h
//  Morphcast
//
//  Created by Marco Rossi on 01/12/16.
//  Copyright © 2016 CYNNY INC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYNPhotoSearchController;

/** The collection view controller in charge of displaying the resulting thumb images. */
@interface CYNPhotoDisplayViewController : UICollectionViewController <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

/** The view controller's logic controller. */
@property (nonatomic) CYNPhotoSearchController *controller;
/** The view controller's search controller. */
@property (nonatomic, readonly) UISearchController *searchController;
/** The count number of rows of thumbs to be diplayed. */
@property (nonatomic, readonly) NSUInteger rowCount;
/** YES if the controller started a request and loading content. */
@property (nonatomic, readonly, getter = isLoading) BOOL loading;

/**
 Initializes and returns a newly created photo display controller.
 
 @param size The preferred content size, to compute the right amount of rows to be displayed.
 @return A DZNPhotoPickerController instance.
 */
- (instancetype)initWithPreferredContentSize:(CGSize)size;

/**
 Stops any loading HTTP request.
 */
- (void)stopLoadingRequest;

@end

//
//  KDQueryTableViewControler.h
//  HoogleIOS
//
//  Created by Keith Miller on 10/27/13.
//  Copyright (c) 2013 KeithDon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KDQueryTableViewControler : UITableViewController <UISearchBarDelegate>
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
@property (nonatomic, strong) NSString *query;

@end

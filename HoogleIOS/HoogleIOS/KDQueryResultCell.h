//
//  KDQueryResultCell.h
//  HoogleIOS
//
//  Created by Donald Huang on 10/28/13.
//  Copyright (c) 2013 KeithDon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KDQueryResultCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) NSString *urlString;
@end

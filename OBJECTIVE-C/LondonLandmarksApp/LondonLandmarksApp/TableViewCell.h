//
//  TableViewCell.h
//  LondonLandmarksApp
//
//  Created by Manuel Duarte on 24/11/2025.
//  Copyright © 2025 Manuel Duarte. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellAddress;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@end

NS_ASSUME_NONNULL_END

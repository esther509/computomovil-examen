//
//  SWPeopleCell.h
//  Startwars_API
//
//  Created by Laura Lopez on 11/14/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWPersonCell : UITableViewCell

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *labelTeam1;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *labelTeam2;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTeam1;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTeam2;

@end

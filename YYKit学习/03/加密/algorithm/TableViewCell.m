//
//  TableViewCell.m
//  archiviewroot
//
//  Created by 周磊 on 16/6/1.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        NSLog(@":  %@", self.model.name);

    }
    
    
 }

-(void)setModel:(Model *)model{
    
    
    _model = model;
    
    self.textLabel.text = model.name;
    
    self.detailTextLabel.text = model.detailname;
    
   
}



@end

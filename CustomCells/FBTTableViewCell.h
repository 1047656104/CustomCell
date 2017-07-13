//
//  FBTTableViewCell.h
//  CustomCells
//
//  Created by 刘璐 on 2017/7/11.
//  Copyright © 2017年 刘璐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBTTableViewCell : UITableViewCell
//*****************正式项目中属性要放在.m文件中<为什么我放在.h文件了,demo啊😆,,我懒啊😆,我乐意啊😆,你咬啊😆.....>*/

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;
@property (weak, nonatomic) IBOutlet UIImageView *threeImageView;
@end

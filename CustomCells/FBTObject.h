//
//  FBTObject.h
//  CustomCells
//
//  Created by 刘璐 on 2017/7/12.
//  Copyright © 2017年 刘璐. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,CellType) {
    CellTypeOnlyTitle = 0,
    CellTypeTitleContent,
    CellTypeOneImage,
    CellTypeThreeImage,
    CellTypeADImage,
    CellTypeSecondImage,
};
@interface FBTObject : NSObject
+ (instancetype)objectWithTitle:(NSString *)title content:(NSString *)content images:(NSArray <NSString *>*)images cellType:(CellType)type;
@property (nonatomic,assign) CellType type;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSArray <NSString *>*images;
@end

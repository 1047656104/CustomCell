//
//  FBTObject.m
//  CustomCells
//
//  Created by 刘璐 on 2017/7/12.
//  Copyright © 2017年 刘璐. All rights reserved.
//

#import "FBTObject.h"

@implementation FBTObject
+ (instancetype)objectWithTitle:(NSString *)title content:(NSString *)content images:(NSArray <NSString *>*)images cellType:(CellType)type {
    FBTObject *object = [[FBTObject alloc]init];
    object.title = title;
    object.content = content;
    object.type = type;
    object.images = images;
    return object;
}
@end

//
//  FBTViewController.m
//  CustomCells
//
//  Created by 刘璐 on 2017/7/12.
//  Copyright © 2017年 刘璐. All rights reserved.
//

#import "FBTViewController.h"
#import "FBTTableViewCell.h"
#import "FBTObject.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface FBTViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray <FBTObject *>*objects;
@end

@implementation FBTViewController
#pragma mark System Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configObejcts];
    [self.view addSubview:self.tableView];
    
}
#pragma mark Data Methods
- (void)configObejcts {
    self.objects = [[NSMutableArray alloc]init];
    [self.objects addObject:[FBTObject objectWithTitle:@"只有标题" content:nil images:nil cellType:CellTypeOnlyTitle]];
    [self.objects addObject:[FBTObject objectWithTitle:@"标题" content:@"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容" images:nil cellType:CellTypeTitleContent]];
    [self.objects addObject:[FBTObject objectWithTitle:@"标题图一" content:nil images:@[@"http://spv.auto.soooner.com/group1/M01/50/68/jNIEkViaqxSEYC3GAAAAAB2QAUE787.jpg"] cellType:CellTypeOneImage]];
    [self.objects addObject:[FBTObject objectWithTitle:@"asdasdsada" content:nil images:@[@"http://img5.fblife.com/attachments/20170712/14998267613738.jpg?imageMogr2/thumbnail/x300/gravity/Center/crop/450x300",@"http://img5.fblife.com/attachments/20170712/14998267613738.jpg?imageMogr2/thumbnail/x300/gravity/Center/crop/450x300",@"http://img5.fblife.com/attachments/20170712/14998267613738.jpg?imageMogr2/thumbnail/x300/gravity/Center/crop/450x300"] cellType:CellTypeThreeImage]];

    [self.objects addObject:[FBTObject objectWithTitle:@"标题" content:@"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容" images:nil cellType:CellTypeTitleContent]];
    
    [self.objects addObject:[FBTObject objectWithTitle:@"标题视图二" content:nil images:@[@"http://img5.fblife.com/attachments/20170712/14998267613738.jpg?imageMogr2/thumbnail/x300/gravity/Center/crop/450x300",@"http://img5.fblife.com/attachments/20170712/14998267613738.jpg?imageMogr2/thumbnail/x300/gravity/Center/crop/450x300"] cellType:CellTypeSecondImage]];
    [self.objects addObject:[FBTObject objectWithTitle:@"标题图一" content:nil images:@[@"http://img5.fblife.com/attachments/20170712/14998267613738.jpg?imageMogr2/thumbnail/x300/gravity/Center/crop/450x300"] cellType:CellTypeOneImage]];
    
    [self.objects addObject:[FBTObject objectWithTitle:@"只有标题" content:nil images:nil cellType:CellTypeOnlyTitle]];
    [self.objects addObject:[FBTObject objectWithTitle:@"哈哈哈哈哈哈" content:nil images:@[@"http://img5.fblife.com/attachments/20170712/14998267613738.jpg?imageMogr2/thumbnail/x300/gravity/Center/crop/450x300",@"http://img5.fblife.com/attachments/20170712/14998267613738.jpg?imageMogr2/thumbnail/x300/gravity/Center/crop/450x300",] cellType:CellTypeThreeImage]];
    
    [self.objects addObject:[FBTObject objectWithTitle:nil content:nil images:@[@"http://img5.fblife.com/attachments/20170712/14998267613738.jpg?imageMogr2/thumbnail/x300/gravity/Center/crop/450x300"] cellType:CellTypeADImage]];
    
}

#pragma mark Setter/Getter Methods
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //根据xib约束自适应cell高度给一个大概的估值
        _tableView.estimatedRowHeight = 10;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}
#pragma mark Delegate/DataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FBTObject *object = self.objects[indexPath.row];
    FBTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[@(object.type)stringValue]];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FBTTableViewCell class]) owner:self options:nil] objectAtIndex:object.type];
    }
    //*****************正式项目中一定要到cell文件中去赋值<为什么我在这里赋值,demo啊😆,,我懒啊😆,我乐意啊😆,你咬啊😆.....>***********************
    cell.titleLabel.text = object.title;
    cell.contentLabel.text = object.content;
    cell.firstImageView.hidden = YES;
    cell.secondImageView.hidden = YES;
    cell.threeImageView.hidden = YES;
    for (NSInteger i = 0; i < object.images.count; i ++) {
        if (i == 0) {
            [cell.firstImageView sd_setImageWithURL:[NSURL URLWithString:object.images[i]]];
            cell.firstImageView.hidden = NO;
        }
        if (i == 1) {
            [cell.secondImageView sd_setImageWithURL:[NSURL URLWithString:object.images[i]]];
            cell.secondImageView.hidden = NO;
        }
        if (i == 2) {
            [cell.threeImageView sd_setImageWithURL:[NSURL URLWithString:object.images[i]]];
            cell.threeImageView.hidden = NO;
        }
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

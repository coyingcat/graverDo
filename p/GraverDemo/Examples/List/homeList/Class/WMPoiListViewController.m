//
//  HomeViewController.m
//  WMCoreText
//
//  Created by yan on 2018/11/16.
//  Copyright © 2018年 sankuai. All rights reserved.
//

#import "WMPoiListViewController.h"
#import "WMPoiListViewModel.h"
#import "WMPoiListCell.h"
#import "WMPoiListModel.h"
#import "WMPoiListEngine.h"




#import "YYFPSLabel.h"


@interface WMPoiListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableview;
@property (nonatomic, strong) WMGBaseViewModel *viewModel;


@property (nonatomic, strong) YYFPSLabel * label;

@end

@implementation WMPoiListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.navigationController setTitle:@"商家列表"];
    [self.view addSubview:self.tableview];
    [self fpsDo];
    
    _viewModel = [[WMPoiListViewModel alloc] init];
    _viewModel.engine = [[WMPoiListEngine alloc] init];
    _viewModel.owner = self;
    
    __weak typeof(self) weakSelf = self;
    [_viewModel reloadDataWithParams:@{} completion:^(NSArray<WMGBaseCellData *> *cellLayouts, NSError *error) {
        if (weakSelf) {
            [weakSelf.tableview reloadData];
        }
    }];
    
    
    
}

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.backgroundColor = WMGHEXCOLOR(0xEEEEEE);
    }
    return _tableview;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _viewModel.arrayLayouts.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WMGBaseCellData *cellData = [_viewModel.arrayLayouts objectAtIndex:indexPath.row];
    return cellData.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WMGBaseCellData *cellData = [_viewModel.arrayLayouts objectAtIndex:indexPath.row];
    
    WMGBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellData.cellClass)];
    if (!cell) {
        cell = [(WMGBaseCell *)[cellData.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(cellData.cellClass)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else{
      //  NSLog(@" gg gg gg  11111 ");
    }
    cell.delegate = self;
    [cell setupCellData:cellData];
    
    if (!cell) {
        cell = [[WMGBaseCell alloc] init];
    }
    else{
     //   NSLog(@" gg gg gg  0000 ");
    }
    
    return cell;
}







// 该方法，作废
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController: [UIViewController new] animated: YES];
}


#pragma mark - 点击回调
- (void)titleDidClick_ctrl:(NSString *)title {
    NSLog(@"点击了店铺 %@ 的标题",title);
}





- (void)tagDidClick_ctrl:(WMPoiListCellData *)cellData {
    NSLog(@"点击了店铺 %@ 的 tag     _    _", cellData.name);
    if (![cellData canShowAllTag]) {
        return;
    }
    
    NSInteger index = [_viewModel.arrayLayouts indexOfObject:cellData];
    WMPoiListModel *model = (WMPoiListModel *)cellData.metaData;
    model.showAlltag = !model.showAlltag;
    [model setNeedsUpdateUIData];
    
    [_viewModel refreshModelWithResultSet:_viewModel.engine.resultSet];
    
    [_tableview reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];

}






- (void)fpsDo{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    CGFloat edge = 60;
    self.label = [[YYFPSLabel alloc] initWithFrame: CGRectMake(edge, 20 + 160 , bounds.size.width - edge * 2, 80)];
    [self.view addSubview: self.label];
}


@end

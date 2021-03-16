//
//  MSD_MVVM_ViewController.m
//  ios_Framework
//
//  Created by 马淑栋 on 2021/3/16.
//

#import "MSD_MVVM_ViewController.h"
#import "MSD_MVVM_View.h"
#import "MVVM_ViewModel.h"
#import "MSD_MVVM_Cell.h"
@interface MSD_MVVM_ViewController ()
// 控制器对应的view，所以view的初始化，布局在里面做好
@property (nonatomic, strong) MSD_MVVM_View *dataView;
// 负责网络请求及其他计算或事件处理
@property (nonatomic, strong) MVVM_ViewModel *dataViewModel;
@end

@implementation MSD_MVVM_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initValues];
    
    // 请求数据
    WS(weakSelf);
    [self.dataViewModel requestDta:^{
        [weakSelf.dataView.tableView reloadData];
    } fail:^{
            
    }];
    
}
- (void)initValues
{
    self.navigationItem.title = @"展示数据";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.dataView];
}

#pragma mark 懒加载
- (MVVM_ViewModel *)dataViewModel
{
    if (!_dataViewModel) {
        _dataViewModel = [[MVVM_ViewModel alloc] init];
    }
    return _dataViewModel;
}

- (MSD_MVVM_View *)dataView
{
    if (!_dataView) {
        _dataView = [[MSD_MVVM_View alloc] initWithFrame:kviewRect];
        _dataView.tableView.dataSource = self.dataViewModel;
        _dataView.tableView.delegate = self.dataViewModel;
        [_dataView.tableView registerClass:[MSD_MVVM_Cell class] forCellReuseIdentifier:NSStringFromClass([MSD_MVVM_Cell class])];
    }
    return _dataView;
}

@end

//
//  MSD_MVVM_View.m
//  ios_Framework
//
//  Created by 马淑栋 on 2021/3/16.
//

#import "MSD_MVVM_View.h"

@implementation MSD_MVVM_View

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self layout];
    }
    return self;
}

- (void)layout
{
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.rowHeight = 60;
        [self addSubview:_tableView];
    }
    return _tableView;
}

@end

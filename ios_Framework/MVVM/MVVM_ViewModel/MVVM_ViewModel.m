//
//  MVVM_ViewModel.m
//  ios_Framework
//
//  Created by 马淑栋 on 2021/3/16.
//

#import "MVVM_ViewModel.h"
#import "MSD_MVVM_Cell.h"
@implementation MVVM_ViewModel
//处理数据请求
- (void)requestDta:(void (^)(void))successBlock fail:(void (^)(void))failBlock{
    NSDictionary * params = @{};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"V1.0" forHTTPHeaderField:@"version"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json", nil];
    [manager GET:[NSString stringWithFormat:@"%@/appindexcontext/selectAllAppIndexContext",URLCOMMON] parameters:params headers:params progress:^(NSProgress * _Nonnull downloadProgress){} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        for (NSDictionary * dic in responseObject[@"data"]) {
            MSD_MVVM_Model * model = [[MSD_MVVM_Model alloc] init];
            if ([dic[@"title"] isKindOfClass:[NSString class]]) {
                model.titleString = dic[@"title"];
                [self.dataArr addObject:model];
            }
        }
        if (successBlock) {
            successBlock();
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock();
        }
    }];
}


#pragma makr UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSD_MVVM_Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MSD_MVVM_Cell class])];
    MSD_MVVM_Model *dataModel = self.dataArr[indexPath.row];
    cell.dataModel = dataModel;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.callBlock) {
        MSD_MVVM_Model *dataM = self.dataArr[indexPath.row];
        self.callBlock(dataM);
    }
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}
@end

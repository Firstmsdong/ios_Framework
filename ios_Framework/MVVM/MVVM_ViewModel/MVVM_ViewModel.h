//
//  MVVM_ViewModel.h
//  ios_Framework
//
//  Created by 马淑栋 on 2021/3/16.
//

#import <Foundation/Foundation.h>
#import "MSD_MVVM_Model.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVVM_ViewModel : NSObject<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray * dataArr;
//点击cell的回调
@property(nonatomic,strong)void(^callBlock)(MSD_MVVM_Model * model);
//请求数据
-(void)requestDta:(void(^)(void))successBlock fail:(void(^)(void))failBlock;

@end

NS_ASSUME_NONNULL_END

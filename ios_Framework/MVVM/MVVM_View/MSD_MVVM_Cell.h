//
//  MSD_MVVM_Cell.h
//  ios_Framework
//
//  Created by 马淑栋 on 2021/3/16.
//

#import <UIKit/UIKit.h>
#import "MSD_MVVM_Model.h"
NS_ASSUME_NONNULL_BEGIN

@interface MSD_MVVM_Cell : UITableViewCell
// 接受数据
@property (nonatomic, strong) MSD_MVVM_Model  * dataModel;

@end

NS_ASSUME_NONNULL_END

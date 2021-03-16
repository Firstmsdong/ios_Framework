//
//  MSD_MVVM_Cell.m
//  ios_Framework
//
//  Created by 马淑栋 on 2021/3/16.
//

#import "MSD_MVVM_Cell.h"

@interface MSD_MVVM_Cell()

// 图片
@property (nonatomic, strong) UILabel * titleLab;

@end


@implementation MSD_MVVM_Cell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self layout];
    }
    return self;
}
- (void)layout
{
    self.titleLab.frame = CGRectMake(10, 10, SCREEN_WIDTH-20, 40);
    
}

-(void)setDataModel:(MSD_MVVM_Model *)dataModel{
    self.titleLab.text = dataModel.titleString;
}
- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}




- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end

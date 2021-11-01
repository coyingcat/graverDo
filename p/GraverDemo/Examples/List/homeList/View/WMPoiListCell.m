//
//  WMPoiCell.m
//  WMHomelist
//
//  Created by yan on 2018/11/14.
//  Copyright © 2018年 yan. All rights reserved.
//

#import "WMPoiListCell.h"
#import "WMGListTextView.h"

@interface WMPoiListCell ()

@property (nonatomic, strong) WMGListTextView *drawView;  // 继承了 AsyncView

@end












@implementation WMPoiListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _drawView = [[WMGListTextView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_drawView];
        
    }
    return self;
}

- (void)setupCellData:(WMPoiListCellData *)cellData {
    [super setupCellData:cellData];
    
    
    
    // WMGListTextView
    _drawView.frame = CGRectMake(0, 0, cellData.cellWidth, cellData.cellHeight);
    
    // 拿数据，去渲染
    _drawView.drawerDates = cellData.mutableAttributedTexts;
    // 二次作废
    [_drawView addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
}










- (void)test{
    NSLog(@"view 点击了");
}






// 一次作废


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"cell touchBegan");
   // [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"cell touchesMoved");

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"cell touchesEnded");
  //  [super touchesEnded:touches withEvent:event];
}

@end







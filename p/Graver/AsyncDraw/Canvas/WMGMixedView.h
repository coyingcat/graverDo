//
//  WMGMixedView.h
//  Graver-Meituan-Waimai
//
//  Created by yangyang
//
//  Copyright © 2018-present, Beijing Sankuai Online Technology Co.,Ltd (Meituan).  All rights reserved.
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
    

#import "WMGCanvasControl.h"
#import "WMMutableAttributedItem.h"

typedef NS_ENUM(NSUInteger, WMGTextVerticalAlignment) {
    WMGTextVerticalAlignmentTop,
    WMGTextVerticalAlignmentCenter,
    WMGTextVerticalAlignmentBottom,
    WMGTextVerticalAlignmentCenterCompatibility,
};

typedef NS_ENUM(NSUInteger, WMGTextHorizontalAlignment) {
    WMGTextHorizontalAlignmentLeft,
    WMGTextHorizontalAlignmentCenter,
    WMGTextHorizontalAlignmentRight,
};

@interface WMGMixedView : WMGCanvasControl

// 水平对齐方式
@property (nonatomic, assign) WMGTextHorizontalAlignment horizontalAlignment;

// 垂直对齐方式
@property (nonatomic, assign) WMGTextVerticalAlignment verticalAlignment;

// 行数，default is 0
@property (nonatomic, assign) NSUInteger numerOfLines;

// 待绘制内容
@property (nonatomic, strong) WMMutableAttributedItem *attributedItem;

@end

//
//  HomeListEngine.h
//  GraverDemo
//
//  Created by yan on 2018/12/5.
//


#import "WMGBaseEngine.h"

NS_ASSUME_NONNULL_BEGIN


// 做网络请求的


// 做数据驱动的

// 加工 Model

@interface WMPoiListEngine : WMGBaseEngine

@end

NS_ASSUME_NONNULL_END




/*
 ViewModel 不直接操作 Model
 
 通过一层间接
 
 Engine, 做一个桥接
 
 
 */

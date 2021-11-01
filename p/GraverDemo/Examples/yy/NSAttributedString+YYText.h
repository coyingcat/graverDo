

//
//  NSAttributedString+YYText.h
//  YYKit <https://github.com/ibireme/YYKit>
//
//  Created by ibireme on 14/10/7.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>



NS_ASSUME_NONNULL_BEGIN

/**
 Get pre-defined attributes from attributed string.
 All properties defined in UIKit, CoreText and YYText are included.
 */
@interface NSAttributedString (YYText)

@end



@interface NSMutableAttributedString (YYText)

- (void)setColor:(UIColor *)color range:(NSRange)range;

- (void)setFont:(UIFont *)font range:(NSRange)range;

- (void)setFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END

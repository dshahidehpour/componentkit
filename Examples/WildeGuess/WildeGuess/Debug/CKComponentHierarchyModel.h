// Copyright 2004-present Facebook. All Rights Reserved.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CKComponentHierarchyModel : NSObject <NSCopying>

- (instancetype)initWithTitle:(NSString *)title
                     subtitle:(NSString *)subtitle
                  indentLevel:(NSUInteger)indentLevel;

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;
@property (nonatomic, readonly, assign) NSUInteger indentLevel;

@end

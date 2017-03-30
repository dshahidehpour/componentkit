// Copyright 2004-present Facebook. All Rights Reserved.

#import <ComponentKit/CKCompositeComponent.h>

@interface CKHierarchyComponent : CKCompositeComponent

+ (instancetype)newWithIndentLevel:(NSInteger)indentLevel text:(NSString *)text;

@end

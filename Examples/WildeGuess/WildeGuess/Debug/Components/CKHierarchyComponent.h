// Copyright 2004-present Facebook. All Rights Reserved.

#import <ComponentKit/CKCompositeComponent.h>

@class CKComponentHierarchyModel;

@interface CKHierarchyComponent : CKCompositeComponent

+ (instancetype)newWithModel:(CKComponentHierarchyModel *)model;

@end

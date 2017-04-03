// Copyright 2004-present Facebook. All Rights Reserved.

#import <ComponentKit/CKCompositeComponent.h>
#import <ComponentKit/CKComponentAction.h>

@class CKComponentHierarchyModel;

@interface CKHierarchyComponent : CKCompositeComponent

+ (instancetype)newWithModel:(CKComponentHierarchyModel *)model
                  infoAction:(const CKTypedComponentAction<UIEvent *> &)action;

@end

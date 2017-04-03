// Copyright 2004-present Facebook. All Rights Reserved.

#import <ComponentKit/CKCompositeComponent.h>
#import <ComponentKit/CKComponentAction.h>

@class CKComponentHierarchyModel;

@interface CKHierarchyComponent : CKCompositeComponent

+ (instancetype)newWithModel:(CKComponentHierarchyModel *)model
                   tapAction:(const CKTypedComponentAction<CKComponent *> &)tapAction
                  infoAction:(const CKTypedComponentAction<CKComponent *> &)infoAction;

@end

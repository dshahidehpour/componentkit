// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyComponent.h"

#import <ComponentKit/CKStackLayoutComponent.h>

#import "CKHierarchyDepthComponent.h"
#import "CKHierarchyDescriptionComponent.h"
#import "CKComponentHierarchyModel.h"

@implementation CKHierarchyComponent

+ (instancetype)newWithModel:(CKComponentHierarchyModel *)model
{
  return [super newWithComponent:
          [CKStackLayoutComponent
           newWithView:{}
           size:{}
           style:{
             .direction = CKStackLayoutDirectionHorizontal,
             .alignItems = CKStackLayoutAlignItemsStretch,
           }
           children:{
             {
               [CKHierarchyDepthComponent newWithDepthLevel:model.indentLevel]
             },
             {
               [CKHierarchyDescriptionComponent newWithTitle:model.title subtitle:model.subtitle]
             },
           }]];
}

@end

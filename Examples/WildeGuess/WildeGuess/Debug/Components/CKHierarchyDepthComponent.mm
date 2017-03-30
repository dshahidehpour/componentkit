// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyDepthComponent.h"

#import <ComponentKit/CKStackLayoutComponent.h>

#import "CKHierarchyIndentComponent.h"

@implementation CKHierarchyDepthComponent

+ (instancetype)newWithDepthLevel:(NSInteger)depthLevel
{
  return [super newWithComponent:
          [CKStackLayoutComponent
           newWithView:{}
           size:{.width = depthLevel * 25}
           style:{
             .direction = CKStackLayoutDirectionHorizontal,
             .alignItems = CKStackLayoutAlignItemsStretch,
           }
           children:childrenWithLevel(depthLevel)]];
}

static std::vector<CKStackLayoutComponentChild> childrenWithLevel(NSInteger level)
{
  std::vector<CKStackLayoutComponentChild> children;
  
  for (int i=0; i<level; i++) {
    children.push_back({[CKHierarchyIndentComponent newWithWidth:25 barThickness:3]});
  }
  
  return children;
}

@end

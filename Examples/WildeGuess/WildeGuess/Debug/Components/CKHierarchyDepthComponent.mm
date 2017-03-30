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
           size:{.width = (depthLevel + 1) * 25}
           style:{
             .direction = CKStackLayoutDirectionHorizontal,
             .alignItems = CKStackLayoutAlignItemsStretch,
           }
           children:childrenWithLevel(depthLevel, 25)]];
}

static std::vector<CKStackLayoutComponentChild> childrenWithLevel(NSInteger level, CGFloat width)
{
  std::vector<CKStackLayoutComponentChild> children;
  
  for (int i=0; i<=level; i++) {
    children.push_back({[CKHierarchyIndentComponent newWithWidth:width barThickness:3]});
  }
  
  return children;
}

@end

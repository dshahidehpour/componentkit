// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyIndentComponent.h"

#import <ComponentKit/CKStackLayoutComponent.h>

@implementation CKHierarchyIndentComponent

+ (instancetype)newWithWidth:(CGFloat)width barThickness:(CGFloat)barThickness
{
  return [super newWithComponent:
          [CKStackLayoutComponent
           newWithView:{}
           size:{.width = width}
           style:{
             .direction = CKStackLayoutDirectionHorizontal,
             .justifyContent = CKStackLayoutJustifyContentCenter,
             .alignItems = CKStackLayoutAlignItemsStretch,
           }
           children:{
             {
               [CKComponent
                newWithView:{
                  [UIView class],
                  {
                    {@selector(setBackgroundColor:), [UIColor blackColor]}
                  }
                }
                size:{.width = barThickness}]
             }
           }]];
}

@end

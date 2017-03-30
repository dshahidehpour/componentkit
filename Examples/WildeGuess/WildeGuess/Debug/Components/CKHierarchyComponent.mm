// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyComponent.h"

#import <ComponentKit/CKLabelComponent.h>
#import <ComponentKit/CKStackLayoutComponent.h>

#import "CKHierarchyDepthComponent.h"

@implementation CKHierarchyComponent

+ (instancetype)newWithIndentLevel:(NSInteger)indentLevel text:(NSString *)text
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
               [CKHierarchyDepthComponent newWithDepthLevel:indentLevel]
             },
             {
               [CKLabelComponent
                newWithLabelAttributes:{
                  .string = text,
                  .font = [UIFont systemFontOfSize:36],
                }
                viewAttributes:{
                  {@selector(setBackgroundColor:), [UIColor clearColor]},
                  {@selector(setUserInteractionEnabled:), @NO},
                }
                size:{}]
             },
           }]];
}

@end

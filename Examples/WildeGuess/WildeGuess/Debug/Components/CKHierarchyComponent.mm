// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyComponent.h"

#import <ComponentKit/CKInsetComponent.h>
#import <ComponentKit/CKLabelComponent.h>
#import <ComponentKit/CKStackLayoutComponent.h>

@implementation CKHierarchyComponent

+ (instancetype)newWithIndentLevel:(NSInteger)indentLevel text:(NSString *)text
{
  return [super newWithComponent:
          [CKStackLayoutComponent
           newWithView:{}
           size:{}
           style:{
             .direction = CKStackLayoutDirectionHorizontal
           }
           children:{
             {
               [CKComponent
                newWithView:{}
                size:{.width = 15 * indentLevel }]
             },
             {
               [CKLabelComponent
                newWithLabelAttributes:{
                  .string = text
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

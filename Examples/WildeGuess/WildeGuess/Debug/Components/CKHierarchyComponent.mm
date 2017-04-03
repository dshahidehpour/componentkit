// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyComponent.h"

#import <ComponentKit/CKInsetComponent.h>
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
               [CKHierarchyDescriptionComponent newWithTitle:model.title subtitle:model.subtitle],
               .flexShrink = 1,
             },
             {
               [CKStackLayoutComponent
                newWithView:{}
                size:{}
                style:{
                  .direction = CKStackLayoutDirectionHorizontal,
                  .justifyContent = CKStackLayoutJustifyContentEnd,
                  .alignItems = CKStackLayoutAlignItemsStretch,
                }
                children:{
                  {
                    [CKInsetComponent
                     newWithInsets:{.right = 10}
                     component:
                     [CKComponent
                      newWithView:{
                        [UIView class],
                        {
                          {@selector(setBackgroundColor:), [UIColor redColor]},
                        }
                      }
                      size:{.minWidth = 20}]]
                  },
                }],
               .flexGrow = 1,
             }
           }]];
}

@end

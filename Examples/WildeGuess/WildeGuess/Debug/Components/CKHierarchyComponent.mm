// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyComponent.h"

#import <ComponentKit/CKButtonComponent.h>
#import <ComponentKit/CKInsetComponent.h>
#import <ComponentKit/CKStackLayoutComponent.h>

#import "CKHierarchyDepthComponent.h"
#import "CKHierarchyDescriptionComponent.h"
#import "CKComponentHierarchyModel.h"

#import <UIKit/UIKit.h>

@implementation CKHierarchyComponent

+ (instancetype)newWithModel:(CKComponentHierarchyModel *)model
                  infoAction:(const CKTypedComponentAction<UIEvent *> &)action
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
                     [CKButtonComponent
                      newWithTitles:{
                        { UIControlStateNormal, @"Info" }
                      }
                      titleColors:{
                        { UIControlStateNormal, [UIColor blueColor] },
                        { UIControlStateHighlighted, [UIColor lightGrayColor] },
                      }
                      images:{}
                      backgroundImages:{}
                      titleFont:[UIFont systemFontOfSize:20]
                      selected:NO
                      enabled:YES
                      action:action
                      size:{}
                      attributes:{}
                      accessibilityConfiguration:{}]
                     ]
                  },
                }],
               .alignSelf = CKStackLayoutAlignSelfCenter,
               .flexGrow = 1,
             }
           }]];
}

@end

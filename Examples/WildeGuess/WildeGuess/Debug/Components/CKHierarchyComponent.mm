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
{
  CKTypedComponentAction<CKComponent *> _action;
}

+ (instancetype)newWithModel:(CKComponentHierarchyModel *)model
                  infoAction:(const CKTypedComponentAction<CKComponent *> &)action
{
  CKComponentScope scope(self);
  CKHierarchyComponent *c =
    [super newWithComponent:
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
               [CKInsetComponent
                newWithInsets:{
                  .top = 6,
                  .bottom = 6,
                }
                component:
                [CKHierarchyDescriptionComponent
                 newWithTitle:model.title
                 subtitle:model.subtitle]],
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
                      action:{scope, @selector(tappedButtonWithEvent:)}
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
  
  if (c) {
    c->_action = action;
  }
  
  return c;
}

- (void)tappedButtonWithEvent:(UIEvent *)event
{
  if (_action) {
    _action.send(self, self);
  }
}
                  
@end

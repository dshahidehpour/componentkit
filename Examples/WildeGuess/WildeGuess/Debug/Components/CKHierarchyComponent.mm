// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyComponent.h"

#import <ComponentKit/CKButtonComponent.h>
#import <ComponentKit/CKComponentGestureActions.h>
#import <ComponentKit/CKInsetComponent.h>
#import <ComponentKit/CKStackLayoutComponent.h>

#import "CKHierarchyDepthComponent.h"
#import "CKHierarchyDescriptionComponent.h"
#import "CKComponentHierarchyModel.h"

#import <UIKit/UIKit.h>

@implementation CKHierarchyComponent
{
  CKTypedComponentAction<CKComponent *> _tapAction;
  CKTypedComponentAction<CKComponent *> _infoAction;
}

+ (instancetype)newWithModel:(CKComponentHierarchyModel *)model
                   tapAction:(const CKTypedComponentAction<CKComponent *> &)tapAction
                  infoAction:(const CKTypedComponentAction<CKComponent *> &)infoAction
{
  CKComponentScope scope(self);
  CKHierarchyComponent *c =
    [super
     newWithView:{
       [UIView class],
       {
         CKComponentTapGestureAttribute(@selector(tappedComponent)),
       }
     }
     component:
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
                      action:{scope, @selector(tappedInfoButtonWithEvent:)}
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
    c->_infoAction = infoAction;
    c->_tapAction = tapAction;
  }
  
  return c;
}

- (void)tappedInfoButtonWithEvent:(UIEvent *)event
{
  if (_infoAction) {
    _infoAction.send(self, self);
  }
}

- (void)tappedComponent
{
  if (_tapAction) {
    _tapAction.send(self, self);
  }
}
                  
@end

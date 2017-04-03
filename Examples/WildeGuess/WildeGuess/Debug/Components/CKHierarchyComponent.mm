// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyComponent.h"

#import <ComponentKit/CKLabelComponent.h>
#import <ComponentKit/CKStackLayoutComponent.h>

#import "CKHierarchyDepthComponent.h"
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
               [CKStackLayoutComponent
                newWithView:{}
                size:{}
                style:{
                  .direction = CKStackLayoutDirectionVertical,
                }
                children:{
                  {
                    [CKLabelComponent
                     newWithLabelAttributes:{
                       .string = model.title,
                       .font = [UIFont systemFontOfSize:36],
                     }
                     viewAttributes:{
                       {@selector(setBackgroundColor:), [UIColor clearColor]},
                       {@selector(setUserInteractionEnabled:), @NO},
                     }
                     size:{}]
                  },
                  {
                    [CKLabelComponent
                     newWithLabelAttributes:{
                       .string = model.subtitle,
                       .font = [UIFont systemFontOfSize:12],
                     }
                     viewAttributes:{
                       {@selector(setBackgroundColor:), [UIColor clearColor]},
                       {@selector(setUserInteractionEnabled:), @NO},
                     }
                     size:{}]
                  }
                }]
             },
           }]];
}

@end

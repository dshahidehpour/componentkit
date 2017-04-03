// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKHierarchyDescriptionComponent.h"

#import <ComponentKit/CKLabelComponent.h>
#import <ComponentKit/CKStackLayoutComponent.h>

@implementation CKHierarchyDescriptionComponent

+ (instancetype)newWithTitle:(NSString *)title subtitle:(NSString *)subtitle
{
  return [super newWithComponent:
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
                  .string = title,
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
                  .string = subtitle,
                  .font = [UIFont systemFontOfSize:12],
                }
                viewAttributes:{
                  {@selector(setBackgroundColor:), [UIColor clearColor]},
                  {@selector(setUserInteractionEnabled:), @NO},
                }
                size:{}]
             }
           }]];
}

@end

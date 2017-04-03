// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKComponentHierarchyModel.h"

@implementation CKComponentHierarchyModel

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle indentLevel:(NSUInteger)indentLevel
{
  if (self = [super init]) {
    _title = [title copy];
    _subtitle = [subtitle copy];
    _indentLevel = indentLevel;
  }
  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return self;
}

@end

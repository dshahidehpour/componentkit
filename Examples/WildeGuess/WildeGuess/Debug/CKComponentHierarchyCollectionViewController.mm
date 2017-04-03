// Copyright 2004-present Facebook. All Rights Reserved.

#import "CKComponentHierarchyCollectionViewController.h"

#import <ComponentKit/ComponentKit.h>

#import "CKHierarchyComponent.h"
#import "CKComponentHierarchyModel.h"

@interface CKComponentHierarchyCollectionViewController () <CKComponentProvider, UICollectionViewDelegateFlowLayout>
@end

@implementation CKComponentHierarchyCollectionViewController {
  CKCollectionViewTransactionalDataSource *_dataSource;
  CKComponentFlexibleSizeRangeProvider *_sizeProvider;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
  if (self = [super initWithCollectionViewLayout:layout]) {
    _sizeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
    self.title = @"Component Hierarchy";
  }
  
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.collectionView.backgroundColor = [UIColor whiteColor];
  const CKSizeRange sizeRange = [_sizeProvider sizeRangeForBoundingSize:self.collectionView.bounds.size];
  CKTransactionalComponentDataSourceConfiguration *configuration =
  [[CKTransactionalComponentDataSourceConfiguration alloc] initWithComponentProvider:[self class]
                                                                             context:self
                                                                           sizeRange:sizeRange];
  _dataSource = [[CKCollectionViewTransactionalDataSource alloc] initWithCollectionView:self.collectionView
                                                            supplementaryViewDataSource:nil
                                                                          configuration:configuration];
  NSMutableDictionary<NSIndexPath *, CKComponentHierarchyModel *> *items = [NSMutableDictionary dictionary];
  for (int i=0; i<4; i++) {
    CKComponentHierarchyModel *model =
    [[CKComponentHierarchyModel alloc]
     initWithTitle:@"CKStackLayoutComponent"
     subtitle:NSStringFromCGRect(CGRectMake(0, 414, 57, 56))
     indentLevel:i];
    
    [items setObject:model forKey:[NSIndexPath indexPathForItem:i inSection:0]];
  }
  
  // Insert the initial section
  CKTransactionalComponentDataSourceChangeset *initialChangeset =
  [[[[CKTransactionalComponentDataSourceChangesetBuilder transactionalComponentDataSourceChangeset]
    withInsertedSections:[NSIndexSet indexSetWithIndex:0]]
    withInsertedItems:items]
   build];
  [_dataSource applyChangeset:initialChangeset mode:CKUpdateModeAsynchronous userInfo:nil];
}

#pragma mark - CKComponentProvider

+ (CKComponent *)componentForModel:(CKComponentHierarchyModel *)model context:(id<NSObject>)context
{
  return [CKHierarchyComponent
          newWithModel:model
          tapAction:{context, @selector(tappedComponent:)}
          infoAction:{context, @selector(tappedInfoButton:)}];
}

- (void)tappedComponent:(CKComponent *)component
{
  NSLog(@"Tapped Component %@", component);
}

- (void)tappedInfoButton:(CKComponent *)component
{
  NSLog(@"Tapped Info %@", component);
}
          
#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return [_dataSource sizeForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
  [_dataSource announceWillDisplayCell:cell];
}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
  [_dataSource announceDidEndDisplayingCell:cell];
}


@end

//
//  CollectionViewDataSource.swift
//  SwiftMVVMBinding
//
//  Created by Darren Clark on 2015-11-18.
//  Copyright © 2015 theScore. All rights reserved.
//

import UIKit

extension UICollectionView: DataSourceView {
    public typealias CellView = UICollectionViewCell
    
    public func insertCells(indexPaths indexPaths: [NSIndexPath]) {
        insertItemsAtIndexPaths(indexPaths)
    }
    
    public func deleteCells(indexPaths indexPaths: [NSIndexPath]) {
        deleteItemsAtIndexPaths(indexPaths)
    }
    
    public func batchUpdates(updates: () -> Void) {
        performBatchUpdates(updates, completion: nil)
    }
    
    
    public func indexPathsForSelections() -> [NSIndexPath]? {
        return indexPathsForSelectedItems()
    }
    
    public func select(indexPath indexPath: NSIndexPath) {
        selectItemAtIndexPath(indexPath, animated: false, scrollPosition: .None)
    }
    
    public func deselect(indexPath indexPath: NSIndexPath) {
        deselectItemAtIndexPath(indexPath, animated: false)
    }
    
    
    public func dequeueCell(reuseIdentifier reuseIdentifier: String, indexPath: NSIndexPath) -> UICollectionViewCell {
        return dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    }
}


public class CollectionViewDataSource<S: SubscribableType where S.ValueType: RangeReplaceableCollectionType, S.ValueType.Generator.Element: Equatable>: DataSource<S, UICollectionView>, UICollectionViewDataSource, UICollectionViewDelegate {
    
    public override init(subscribable: S, view: UICollectionView) {
        super.init(subscribable: subscribable, view: view)
    }
    
    //MARK: UICollectionViewDataSource
    
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return numberOfSections()
    }
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems(section: section)
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return cellAtIndexPath(indexPath)
    }
    
    @available(iOS 9, *)
    public func collectionView(collectionView: UICollectionView, canMoveItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return editable && allowsMoving
    }
    
    @available(iOS 9, *)
    public func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        move(source: sourceIndexPath, destination: destinationIndexPath)
    }
    
    //MARK: UICollectionViewDelegate
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        didSelect(indexPath: indexPath)
    }
    
    public func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        didDeselect(indexPath: indexPath)
    }
    
}
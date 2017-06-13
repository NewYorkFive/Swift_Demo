//
//  DLCollectionViewFlowLayout.swift
//  Swift_Circle_CollectionView
//
//  Created by NowOrNever on 13/06/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

import UIKit

private var itemsAttributesArray:[UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()

class DLCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        let itemCount = collectionView?.numberOfItems(inSection: 0)
//        print(itemCount)
        
        let collectionViewRadius = collectionView!.size.height < collectionView!.size.width ? (collectionView?.size.height)! * 0.5 : (collectionView?.size.width)! * 0.5
        
        
        let center = CGPoint.init(x: (collectionView?.bounds.size.width)! * 0.5, y: (collectionView?.bounds.size.height)! * 0.5)
        
        let itemRadius:CGFloat = 20.0;
        
//        let itemsAttributes = layoutAttributesForElements(in: (collectionView?.bounds)!)
        
        itemsAttributesArray = [UICollectionViewLayoutAttributes]()
        
        for i in 0..<itemCount! {
            let attris = layoutAttributesForItem(at: IndexPath.init(row: i, section: 0))
            attris?.size = CGSize.init(width: itemRadius * 2, height: itemRadius * 2)
            let x = center.x + cos(2 * CGFloat.pi / CGFloat(itemCount!) * CGFloat(i)) * (collectionViewRadius - itemRadius)
            let y = center.y + sin(2 * CGFloat.pi / CGFloat(itemCount!) * CGFloat(i)) * (collectionViewRadius - itemRadius)
            attris?.center = CGPoint.init(x: x, y: y)
            itemsAttributesArray.append(attris!)
//            print(i)
//            print(attris?.center)
        }
        
//        for item in itemsAttributes! {
//            item.size = CGSize.init(width: itemRadius * 2, height: itemRadius * 2)
//            let x = (center?.x)! + cos(2 * CGFloat.pi / CGFloat((itemsAttributes?.count)!) * count) * (collectionViewRadius! - itemRadius)
//            let y = (center?.y)! + cos(2 * CGFloat.pi / CGFloat((itemsAttributes?.count)!) * count) * (collectionViewRadius! - itemRadius)
//            item.center = CGPoint.init(x: x, y: y)
//            count = count + 1.0
//        }
        
//        print(elements?.count)
        
//        open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?
        
//        open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? // return an array layout attributes instances for all the views in the given rect

    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return itemsAttributesArray
    }
    
    override var collectionViewContentSize: CGSize{
        return (collectionView?.bounds.size)!
    }
}

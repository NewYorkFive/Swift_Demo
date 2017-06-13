//
//  ViewController.swift
//  Swift_Circle_CollectionView
//
//  Created by NowOrNever on 13/06/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

//collectionview的cell做环形布局

import UIKit
private let collectionViewCellId = "collectionViewCellId"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate func setupUI(){
        view.addSubview(collectionView)
        collectionView.frame = CGRect.init(x: 0, y: 0, width: 300, height: 300)
        collectionView.center = view.center
    }

    fileprivate lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: DLCollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellId)
        return collectionView
    }()

}


extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellId, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

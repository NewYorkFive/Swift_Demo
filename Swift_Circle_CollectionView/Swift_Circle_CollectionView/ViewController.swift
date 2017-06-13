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
        collectionView.backgroundColor = view.backgroundColor
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(panAction))
        collectionView.addGestureRecognizer(panGesture)
        panGesture.delegate = self
    }

    fileprivate lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: DLCollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellId)
        return collectionView
    }()

    
    
}

var lastPosition:CGPoint = CGPoint.zero
var currentAngle:CGFloat = 0.0

extension ViewController{
    @objc func panAction(sender:UIPanGestureRecognizer){
        let point = sender.location(in: sender.view)
        if lastPosition == point {
            return
        }
        if lastPosition == CGPoint.zero {
            lastPosition = point
            return
        }
        let angle = calculateAngle(center: CGPoint.init(x: collectionView.bounds.size.width * 0.5, y: collectionView.bounds.size.height * 0.5), firstPoint:  lastPosition, secondPoint: point)
        print("angle")
        print(angle)
        print(" ")
        
//        if angle > CGFloat.pi / 180.0 * 2 || angle < CGFloat.pi / -180.0 * 2 {
//            currentAngle = currentAngle + angle;
//            collectionView.transform = CGAffineTransform.init(rotationAngle: currentAngle)
            collectionView.transform = collectionView.transform.rotated(by: angle)
            lastPosition = CGPoint.zero
//        }
    }
    
    func calculateAngle(center:CGPoint, firstPoint:CGPoint, secondPoint:CGPoint) -> CGFloat {
        
        let firstPointInCoordinates = CGPoint.init(x: firstPoint.x - center.x, y: center.y - firstPoint.y)
        let firstTanValue = firstPointInCoordinates.x / firstPointInCoordinates.y;
        let firstAngle = atan(firstTanValue)
        
        let secondPointInCoordinates = CGPoint.init(x: secondPoint.x - center.x, y: center.y - secondPoint.y)
        let secondTanValue = secondPointInCoordinates.x / secondPointInCoordinates.y;
        let secondAngle = atan(secondTanValue)
        
//        print("firstPoint:" + NSStringFromCGPoint(firstPoint))
//        print("secondPoint:" + NSStringFromCGPoint(secondPoint))
//        print("center:" + NSStringFromCGPoint(center))
        
//        print(firstAngle)
//        print(secondAngle)
        
//        print(" ")
        return secondAngle - firstAngle;
    }
}

extension ViewController:UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        lastPosition = CGPoint.zero
        print("should began")
        return true
    }
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

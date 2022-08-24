//
//  ViewController.swift
//  Agust22
//
//  Created by 이태형 on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {
    var colors: [UIColor] = [.systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemPink, .systemTeal, .systemBrown, .systemOrange, .systemIndigo, .systemPurple, .systemYellow, .systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemPink, .systemTeal, .systemBrown, .systemOrange, .systemIndigo, .systemPurple, .systemYellow]
    
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayoutUI()
        setUI()
        addGesture()
    }

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else{fatalError()}
        cell.backgroundColor = colors[indexPath.item]
        cell.label.text = "\(indexPath)"
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let color = colors.remove(at: sourceIndexPath.item)
        colors.insert(color, at: destinationIndexPath.item)
        
    }
}

extension ViewController{
    func flowLayoutUI(){
        flowLayout.itemSize = CGSize(width: view.frame.width / 3.3, height: view.frame.height / 4)  //아이템 크키
        flowLayout.minimumInteritemSpacing = 10  //아이템간의 가로 거리
        flowLayout.minimumLineSpacing = 20  //아이템 간의 세로 거리
        flowLayout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)  //테두리 거리
        
//        flowLayout.scrollDirection = .horizontal
    }
    
    func setUI(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addGesture(){
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLogPress(_:)))
        collectionView.addGestureRecognizer(gesture)
    }
    
    @objc func didLogPress(_ sender: UILongPressGestureRecognizer){
        let location = sender.location(in: collectionView)  //collectionView내 위치
        switch sender.state {
        case .began:
            guard let indexPath = collectionView.indexPathForItem(at: location) else{return} //해당위치의 indexPath를 가져옴(else: 아이템 사이의 공간)
            collectionView.beginInteractiveMovementForItem(at: indexPath)
            print(indexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(location)
        case .ended:
            collectionView.endInteractiveMovement()
        case .cancelled:
            collectionView.cancelInteractiveMovement()
        default:
            break
        }
    }
}

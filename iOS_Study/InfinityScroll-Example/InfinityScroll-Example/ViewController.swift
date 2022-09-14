//
//  ViewController.swift
//  InfinityScroll-Example
//
//  Created by 이태형 on 2022/09/14.
//

import UIKit

class ViewController: UIViewController {
    private var cellWidth: CGFloat = 0
    private let colors: [UIColor] = [.yellow, .red, .green, .blue, .purple, .yellow, .red, .green]  //원래순서 : .red, .green, .blue, .purple, .yellow
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setFlowLayout()
//        print(collectionView.frame, #function)
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else{fatalError()}
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
}
extension ViewController: UICollectionViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        performINfiniteScroll(scrollView: scrollView)
    }
    
    func performINfiniteScroll(scrollView: UIScrollView){
        guard colors.count > 1 else{return}
        let current = scrollView.contentOffset.x
        let firstPage = cellWidth
        let lastPage = cellWidth * CGFloat(colors.count - 3)
        let fakeFirstPage = cellWidth * CGFloat(colors.count - 2)
        let fakeLastPage: CGFloat = 0
//        if scrollView.contentOffset.x == firstPage{
//            print("First")
//        } else if scrollView.contentOffset.x == lastPage{
//            print("Last")
//        }
        if current == fakeFirstPage{
            collectionView.contentOffset.x = firstPage
        } else if current == fakeLastPage{
            collectionView.contentOffset.x = lastPage
        }
    }
    
}

extension ViewController{
    private func setFlowLayout(){
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else{ fatalError() }
        let width = collectionView.frame.width
        let height = collectionView.frame.width
        let left: CGFloat = colors.count > 1 ? -20 : 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: 0)
        flowLayout.itemSize = CGSize(width: width, height: height)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        cellWidth = width
        collectionView.contentOffset.x = width
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setUI(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collectionView.isPagingEnabled = true
        
        view.backgroundColor = .systemBackground
        collectionView.backgroundColor = .black
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1)
        ])
    }
}

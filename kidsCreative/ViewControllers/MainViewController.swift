//
//  ViewController.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(MainViewCell.self, forCellWithReuseIdentifier: "mainViewCell")
    }

<<<<<<< HEAD
}

//MARK: UICollectionView DataSource Extension
<<<<<<< HEAD
extension MainView: UICollectionViewDataSource {
=======
extension MainViewController: UICollectionViewDataSource {
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainViewCell", for: indexPath) as? MainViewCell else {
            fatalError("could not downcast to MainViewCell")
        }
        return cell
    }
}
//MARK: UICollectionView Delegate Extension
<<<<<<< HEAD
extension MainView: UICollectionViewDelegateFlowLayout {
=======
extension MainViewController: UICollectionViewDelegateFlowLayout {
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width
        let itemHeight: CGFloat = maxSize.height * 0.75 // 75%
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
<<<<<<< HEAD
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
}

=======
=======
}

//MARK: UICollectionView DataSource Extension
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainViewCell", for: indexPath) as? MainViewCell else {
            fatalError("could not downcast to MainViewCell")
        }
        return cell
    }
}
//MARK: UICollectionView Delegate Extension
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width
        let itemHeight: CGFloat = maxSize.height * 0.75 // 75%
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}
<<<<<<< HEAD
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
=======
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66

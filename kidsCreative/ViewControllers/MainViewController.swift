//
//  ViewController.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import Firebase


class MainViewController: UIViewController {
    
    private let db = FireBaseDataService()
    
    private var savedActivity = [Activity]() {
        didSet {
            mainView.collectionView.reloadData()
        }
    }
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(MainViewCell.self, forCellWithReuseIdentifier: "mainViewCell")
        navigationItem.title = "Kid's Activity"
        loadData()
    }
    
    private func loadData() {
        fetchActivity()
    }
    
    @objc
    private func fetchActivity(){
        db.getActivity(item: Activity.self) { [weak self] (result) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Fetching Error", message: error.localizedDescription)
                }
            case .success(let item):
                self?.savedActivity = item
            }
        }
        
        
        
    }
}
//MARK: UICollectionView DataSource Extension
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedActivity.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainViewCell", for: indexPath) as? MainViewCell else {
            fatalError("could not downcast to MainViewCell")
        }
        let savedActivities = savedActivity[indexPath.row]
        cell.configureCell(for: savedActivities)
        return cell
    }
}
//MARK: UICollectionView Delegate Extension
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize = UIScreen.main.bounds
    
        let height = maxSize.height * 0.25
        let width = maxSize.width * 0.45
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // programmatically Segue
        let activity = savedActivity[indexPath.row]
        let detailVC = DetailViewController()
        
        detailVC.activity = activity
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
              return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
          }
}

//
//  DataBaseService.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import FirebaseFirestoreSwift
import Firebase

final class FireBaseDataService {
    static let activityCollection = "activity"
    private let db = Firestore.firestore()
    
    public func getActivity<T: Codable>(item: T.Type, completion: @escaping (Result<[T], Error>) -> ()) {
           db.collection(FireBaseDataService.activityCollection).getDocuments { (snapshot, error) in
                   if let error = error {
                       completion(.failure(error))
                   } else if let snapshot = snapshot {
                       let items = snapshot.documents.compactMap { try? $0.data(as: T.self) }
                       completion(.success(items))
           }
       }
       }
}

//
//  MainViewModel.swift
//  Simple-
//
//  Created by Денис Александров on 06.12.2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable(nil)
    var dataSource: [User]?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numbersOfRows(_ section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFech.shared.fetchUsers { [weak self] users, error in
            guard let self else { return }
            self.isLoading.value = false
            if let users {
                self.dataSource = users
                mapCellData()
            }
            
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = dataSource?.compactMap({MainCellViewModel($0) })
    }
    
}

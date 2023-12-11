//
//  MainCellViewModel.swift
//  Simple-
//
//  Created by Денис Александров on 10.12.2023.
//

import Foundation

class MainCellViewModel {
    var name: String
    var email: String
    
    init(_ user: User) {
        self.name = user.username
        self.email = user.email
    }
}

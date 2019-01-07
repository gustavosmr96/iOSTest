//
//  MoviesCellViewModel.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 07/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import Foundation

class MoviesCellViewModel{
    
    private let title: String
    
    init(_ title: String) {
        self.title = title
    }
    public func labelValue() -> String {
        return self.title
    }
}

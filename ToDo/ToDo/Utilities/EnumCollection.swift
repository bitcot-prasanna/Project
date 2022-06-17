//
//  EnumCollection.swift
//  ToDo
//
//  Created by Prasanna Kumar Joshi on 15/06/22.
//

import Foundation
import EmptyStateKit

enum State: CustomState {

    case noData
   

    var image: UIImage? {
        switch self {
        case .noData: return UIImage(named: "cart")
        }
    }

    var title: String? {
        switch self {
        case .noData: return "No Data"
        }
    }

    var description: String? {
        switch self {
        case .noData: return "Sorry, you don't have any data. Please add here by pressing below Add here Button!"
        }
    }

    var titleButton: String? {
        switch self {
        case .noData: return "Add here"
     
        }
    }
}

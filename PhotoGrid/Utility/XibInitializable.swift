//
//  XibInitializable.swift
//  PhotoGrid
//
//  Created by Ankit Angra on 2022-04-26.
//

import UIKit

protocol XibInitializable {
    static var name: String { get }
    static var bundle: Bundle? { get }
    static func fromXib() -> UINib
}

extension XibInitializable {
    static var name: String {
        return String(describing: Self.self)
    }

    static var bundle: Bundle? {
        return nil
    }

    static func fromXib() -> UINib {
        return UINib(nibName: name, bundle: bundle)
    }
}

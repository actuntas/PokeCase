//
//  NSObject+Ext.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import Foundation

protocol ViewIdentifier: AnyObject {
    var viewIdentifier: String { get }
    static var viewIdentifier: String { get }
}

extension ViewIdentifier {
    static var viewIdentifier: String {
        String(describing: self)
    }
    
    var viewIdentifier: String {
        let typeOfSelf = type(of: self)
        return String(describing: typeOfSelf)
    }
}

extension NSObject: ViewIdentifier {}

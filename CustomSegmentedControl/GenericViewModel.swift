//
//  GenericViewModel.swift
//  CustomSegmentedControl
//
//  Created by James Rochabrun on 9/2/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

//MARK: Generic viewmodel that accepts an array of T
//Main responsability is to return the element selected at index
struct GenericViewModel<T>: IndexReturnable {

    var itemsForSelection: [T]
    
    init(items: [T]) {
        self.itemsForSelection = items
    }
    
    func getItem(at index: Int) -> T {
        return self.itemsForSelection[index]
    }
    
    mutating func update(items: [T]) {
        self.itemsForSelection.removeAll()
        self.itemsForSelection = items
    }
}

//Protocol with associated Type
protocol IndexReturnable {
    
    associatedtype Object
    var itemsForSelection : [Object] { get set }
    func getItem(at index: Int) -> Object
}





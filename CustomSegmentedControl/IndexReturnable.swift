//
//  IndexReturnable.swift
//  CustomSegmentedControl
//
//  Created by James Rochabrun on 9/4/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

//Protocol with associated Type
protocol IndexReturnable {
    
    associatedtype Object
    var itemsForSelection : [Object] { get set }
    func getItem(at index: Int) -> Object
}

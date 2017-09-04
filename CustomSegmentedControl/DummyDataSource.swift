//
//  DummyDataSource.swift
//  CustomSegmentedControl
//
//  Created by James Rochabrun on 9/4/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class DummyDataSource {
    
    static func colorItems() -> [UIColor] {
        return [#colorLiteral(red: 0.3176470588, green: 0.831372549, blue: 0.9098039216, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
    }
    
    static func iconItems() -> [UIImage] {
        return  [#imageLiteral(resourceName: "home") , #imageLiteral(resourceName: "heart"), #imageLiteral(resourceName: "ink")]
    }
    
    static func textItems() -> [String] {
        return ["Option 1", "Option2"]
    }
    
    static func options() -> [String] {
        return ["Option 1", "Option2", "Option 3"]
    }
    
    static func imageItems() -> [UIImage] {
        return [#imageLiteral(resourceName: "icon25"), #imageLiteral(resourceName: "icon24"), #imageLiteral(resourceName: "icon29"), #imageLiteral(resourceName: "icon19")]
    }
    
}

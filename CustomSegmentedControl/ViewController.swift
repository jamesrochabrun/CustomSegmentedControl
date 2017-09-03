//
//  ViewController.swift
//  CustomSegmentedControl
//
//  Created by James Rochabrun on 9/2/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
@IBDesignable

class ViewController: UIViewController {
    
    //MARK: Colors just for example
    static let thumbTintColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    static let uiTintColorForUnSelected = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    static let uiTintColorForSelected = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var dynamicImagesSegmentedControl: CustomSegmentedControl! {
        didSet {
            dynamicImagesSegmentedControl.itemsWithText = false
            dynamicImagesSegmentedControl.fillEqually = false
            dynamicImagesSegmentedControl.buttonsWithDynamicImages = true
            let images = [#imageLiteral(resourceName: "home") , #imageLiteral(resourceName: "heart")]
            dynamicImagesSegmentedControl.setSelectorWith(images: images)
            dynamicImagesSegmentedControl.padding = 0
            dynamicImagesSegmentedControl.thumbViewColor = ViewController.thumbTintColor
            
        }
    }
    
    @IBOutlet weak var textSegmentedControl: CustomSegmentedControl! {
        didSet {
            textSegmentedControl.itemsWithText = true
            textSegmentedControl.fillEqually = true
            let strings = ["Classic Paper", "Luxe Paper"]
            textSegmentedControl.setSelectorWith(titles: strings)
            textSegmentedControl.padding = 2
            textSegmentedControl.textColor = ViewController.uiTintColorForUnSelected
            textSegmentedControl.selectedTextColor = ViewController.uiTintColorForSelected
            textSegmentedControl.thumbViewColor = ViewController.thumbTintColor
            textSegmentedControl.titlesFont = UIFont(name: "OpenSans-Semibold", size: 14)
        }
    }

    @IBOutlet weak var colorsSegmentedControl: CustomSegmentedControl! {
        didSet {
            let colors: [UIColor] = [#colorLiteral(red: 1, green: 0.5484918952, blue: 0, alpha: 1),  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)]
            colorsSegmentedControl.setSelectorWith(colors: colors)
            colorsSegmentedControl.itemsWithDynamicColor = true
            colorsSegmentedControl.fillEqually = true
            colorsSegmentedControl.roundedControl = true
          //  colorsSegmentedControl.segmentedBackGroundColor = .red
            colorsSegmentedControl.imageForItemWithDynamicColors = UIImage(named: "vignette")
            colorsSegmentedControl.setSelectorWith(colors: colors)
            colorsSegmentedControl.padding = 2
            colorsSegmentedControl.thumbViewColor = ViewController.thumbTintColor
            colorsSegmentedControl.animationDuration = 0.1
           // foilSegmentedControlViewModel = KMCustomSegmentedControlViewModel<FoilColor>(items: foilColors)
        }
    }
    
    @IBOutlet weak var iconsSegmentedControl: CustomSegmentedControl! {
        didSet {
            iconsSegmentedControl.itemsWithText = false
            iconsSegmentedControl.fillEqually = false
            let images = [#imageLiteral(resourceName: "home") , #imageLiteral(resourceName: "heart"), #imageLiteral(resourceName: "ink")]
            iconsSegmentedControl.setSelectorWith(images: images)
            iconsSegmentedControl.padding = 2
            iconsSegmentedControl.thumbViewColor = ViewController.thumbTintColor
            iconsSegmentedControl.buttonColorForNormal =  ViewController.uiTintColorForUnSelected
            iconsSegmentedControl.buttonColorForSelected = ViewController.uiTintColorForSelected
        }
    }
    
    @IBOutlet weak var textSquareSegmentedControl: CustomSegmentedControl! {
        didSet {
            textSquareSegmentedControl.itemsWithText = true
            textSquareSegmentedControl.fillEqually = true
            let strings = ["Classic Paper", "Luxe Paper"]
            textSquareSegmentedControl.setSelectorWith(titles: strings)
            textSquareSegmentedControl.padding = 2
            textSquareSegmentedControl.textColor = ViewController.uiTintColorForUnSelected
            textSquareSegmentedControl.selectedTextColor = ViewController.uiTintColorForSelected
            textSquareSegmentedControl.thumbViewColor = ViewController.thumbTintColor
            textSquareSegmentedControl.titlesFont = UIFont(name: "OpenSans-Semibold", size: 14)
        }
    }
    
    @IBOutlet weak var linearThumbViewSegmentedControl: CustomSegmentedControl!
    
    @IBOutlet weak var regularSquareSegmentedControl: CustomSegmentedControl!
    
}

class DummyDataSource {
    
    static func colorItems() -> [UIColor] {
        return [#colorLiteral(red: 1, green: 0.5484918952, blue: 0, alpha: 1),  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)]
    }
    
    static func iconItems() -> [UIImage] {
        return  [#imageLiteral(resourceName: "home") , #imageLiteral(resourceName: "heart"), #imageLiteral(resourceName: "ink")]
    }
    
    static func textItems() -> [String] {
        return ["Open", "Close"]
    }
    
    static func imageItems() -> [UIImage] {
        return []
    }
}


















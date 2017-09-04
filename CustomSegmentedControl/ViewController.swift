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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: 1 set this values for a selector where images represent the state of the selection
    @IBOutlet weak var dynamicImagesSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            dynamicImagesSegmentedControl.fillEqually = false
            dynamicImagesSegmentedControl.buttonsWithDynamicImages = true
            dynamicImagesSegmentedControl.roundedControl = true
            
            let images = DummyDataSource.imageItems()
            dynamicImagesSegmentedControl.setSelectorWith(images: images)
            dynamicImagesSegmentedControl.padding = 2
            dynamicImagesSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
        }
    }
    
    //MARK: 2 set this values for a selector with rounded appereance with text
    @IBOutlet weak var textSegmentedControl: CustomSegmentedControl! {
        didSet {
            textSegmentedControl.itemsWithText = true
            textSegmentedControl.fillEqually = true
            textSegmentedControl.roundedControl = true
            
            let strings = ["Classic Paper", "Luxe Paper jkjh"]
            textSegmentedControl.setSelectorWith(titles: strings)
            textSegmentedControl.padding = 2
            textSegmentedControl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            textSegmentedControl.selectedTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
            textSegmentedControl.titlesFont = UIFont(name: "OpenSans-Semibold", size: 14)
        }
    }

    //MARK: 3
    @IBOutlet weak var colorsSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            colorsSegmentedControl.itemsWithDynamicColor = true
            colorsSegmentedControl.fillEqually = false
            colorsSegmentedControl.roundedControl = true
            
            let colors: [UIColor] = [#colorLiteral(red: 1, green: 0.5484918952, blue: 0, alpha: 1),  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)]
            colorsSegmentedControl.setSelectorWith(colors: colors)
            colorsSegmentedControl.imageForItemWithDynamicColors = UIImage(named: "vignette")
            colorsSegmentedControl.setSelectorWith(colors: colors)
            colorsSegmentedControl.padding = 2
            colorsSegmentedControl.thumbViewColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            colorsSegmentedControl.animationDuration = 0.1
           // foilSegmentedControlViewModel = KMCustomSegmentedControlViewModel<FoilColor>(items: foilColors)
        }
    }
    
    //MARK: 4
    @IBOutlet weak var iconsSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            iconsSegmentedControl.itemsWithText = false
            iconsSegmentedControl.fillEqually = false
            iconsSegmentedControl.roundedControl = true
            
            let images = [#imageLiteral(resourceName: "home") , #imageLiteral(resourceName: "heart"), #imageLiteral(resourceName: "ink")]
            iconsSegmentedControl.setSelectorWith(images: images)
            iconsSegmentedControl.padding = 2
            iconsSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
            iconsSegmentedControl.buttonColorForNormal = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            iconsSegmentedControl.buttonColorForSelected = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    //MARK: 5
    @IBOutlet weak var textSquareSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            textSquareSegmentedControl.itemsWithText = true
            textSquareSegmentedControl.fillEqually = true
            
            let strings = ["Classic Paper", "test"]
            textSquareSegmentedControl.setSelectorWith(titles: strings)
            textSquareSegmentedControl.padding = 2
            textSquareSegmentedControl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            textSquareSegmentedControl.selectedTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textSquareSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
        }
    }
    
    //MARK: 6
    @IBOutlet weak var linearThumbViewSegmentedControl: CustomSegmentedControl! {
        didSet {
            
        linearThumbViewSegmentedControl.itemsWithText = true
        linearThumbViewSegmentedControl.fillEqually = true
        linearThumbViewSegmentedControl.bottomLineThumbView = true
        
        let strings = ["Classic Paper", "test"]
        linearThumbViewSegmentedControl.setSelectorWith(titles: strings)
        linearThumbViewSegmentedControl.padding = 2
        linearThumbViewSegmentedControl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        linearThumbViewSegmentedControl.selectedTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        linearThumbViewSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
 
        }
    }
    
    //MARK: 7
    @IBOutlet weak var hiddenThumbViewSegmentedControl: CustomSegmentedControl! {
        
        didSet {
            hiddenThumbViewSegmentedControl.itemsWithText = true
            hiddenThumbViewSegmentedControl.fillEqually = true
            hiddenThumbViewSegmentedControl.thumbViewHidden = true
            
            let strings = ["Classic Paper", "test"]
            hiddenThumbViewSegmentedControl.setSelectorWith(titles: strings)
            hiddenThumbViewSegmentedControl.padding = 2
            hiddenThumbViewSegmentedControl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            hiddenThumbViewSegmentedControl.selectedTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            hiddenThumbViewSegmentedControl.titlesFont = UIFont(name: "OpenSans-Semibold", size: 14)
        }
    }
    
    //MARK: 8
    
    @IBOutlet weak var youtubeLikeSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            youtubeLikeSegmentedControl.itemsWithText = false
            youtubeLikeSegmentedControl.bottomLineThumbView = true
            youtubeLikeSegmentedControl.fillEqually = true
            
            let images = [#imageLiteral(resourceName: "home") , #imageLiteral(resourceName: "heart"), #imageLiteral(resourceName: "ink")]
            youtubeLikeSegmentedControl.setSelectorWith(images: images)
            youtubeLikeSegmentedControl.padding = 2
            youtubeLikeSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
            youtubeLikeSegmentedControl.buttonColorForNormal =  #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            youtubeLikeSegmentedControl.buttonColorForSelected = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
        }
    }
}

class DummyDataSource {
    
    static func colorItems() -> [UIColor] {
        return [#colorLiteral(red: 1, green: 0.5484918952, blue: 0, alpha: 1),  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)]
    }
    
    static func iconItems() -> [UIImage] {
        return  [#imageLiteral(resourceName: "home") , #imageLiteral(resourceName: "heart"), #imageLiteral(resourceName: "ink")]
    }
    
    static func textItems() -> [String] {
        return ["Option 1", "Option2"]
    }
    
    static func imageItems() -> [UIImage] {
        return [#imageLiteral(resourceName: "icon25"), #imageLiteral(resourceName: "icon24"), #imageLiteral(resourceName: "icon29"), #imageLiteral(resourceName: "icon19")]
    }
    
}


















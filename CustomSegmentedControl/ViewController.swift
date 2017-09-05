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
    
    //Properties
    private var colorsGenericViewModel: GenericViewModel<UIColor>?
    
    //MARK: 1 set this values for a selector where images represent the state of the selection
    @IBOutlet weak var dynamicImagesSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            dynamicImagesSegmentedControl.fillEqually = false
            dynamicImagesSegmentedControl.buttonsWithDynamicImages = true
            dynamicImagesSegmentedControl.roundedControl = true
            
            let images = DummyDataSource.imageItems()
            dynamicImagesSegmentedControl.setSegmentedWith(items: images)
            dynamicImagesSegmentedControl.padding = 2
            dynamicImagesSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
        }
    }
    
    //MARK: 2 set this values for a selector with rounded appereance with text
    @IBOutlet weak var textSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            textSegmentedControl.itemsWithText = true
            textSegmentedControl.fillEqually = true
            textSegmentedControl.roundedControl = true
            
            let strings = DummyDataSource.textItems()
            textSegmentedControl.setSegmentedWith(items: strings)
            textSegmentedControl.padding = 2
            textSegmentedControl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            textSegmentedControl.selectedTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
            textSegmentedControl.titlesFont = UIFont(name: "OpenSans-Semibold", size: 14)
        }
    }
    
    //MARK: 3
    @IBOutlet weak var iconsSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            iconsSegmentedControl.itemsWithText = false
            iconsSegmentedControl.fillEqually = false
            iconsSegmentedControl.roundedControl = false
            
            let icons = DummyDataSource.iconItems()
            iconsSegmentedControl.setSegmentedWith(items: icons)
            iconsSegmentedControl.padding = 2
            iconsSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
            iconsSegmentedControl.buttonColorForNormal = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            iconsSegmentedControl.buttonColorForSelected = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    //MARK: 4
    @IBOutlet weak var textSquareSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            textSquareSegmentedControl.itemsWithText = true
            textSquareSegmentedControl.fillEqually = true
            
            let strings = DummyDataSource.textItems()
            textSquareSegmentedControl.setSegmentedWith(items: strings)
            textSquareSegmentedControl.padding = 2
            textSquareSegmentedControl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            textSquareSegmentedControl.selectedTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textSquareSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
        }
    }
    
    //MARK: 5
    @IBOutlet weak var youtubeLikeSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            youtubeLikeSegmentedControl.itemsWithText = false
            youtubeLikeSegmentedControl.bottomLineThumbView = true
            youtubeLikeSegmentedControl.fillEqually = true
            
            let icons = DummyDataSource.iconItems()
            youtubeLikeSegmentedControl.setSegmentedWith(items: icons)
            youtubeLikeSegmentedControl.padding = 2
            youtubeLikeSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
            youtubeLikeSegmentedControl.buttonColorForNormal =  #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            youtubeLikeSegmentedControl.buttonColorForSelected = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
        }
    }

    //MARK: 6
    @IBOutlet weak var hiddenThumbViewSegmentedControl: CustomSegmentedControl! {
        
        didSet {
            
            //Set this booleans to adapt control
            hiddenThumbViewSegmentedControl.itemsWithText = true
            hiddenThumbViewSegmentedControl.fillEqually = true
            hiddenThumbViewSegmentedControl.thumbViewHidden = true
            
            let strings = DummyDataSource.textItems()
            hiddenThumbViewSegmentedControl.setSegmentedWith(items: strings)
            hiddenThumbViewSegmentedControl.padding = 2
            hiddenThumbViewSegmentedControl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            hiddenThumbViewSegmentedControl.selectedTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }
    
    //MARK: 7
    @IBOutlet weak var linearThumbViewSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            linearThumbViewSegmentedControl.itemsWithText = true
            linearThumbViewSegmentedControl.fillEqually = true
            linearThumbViewSegmentedControl.bottomLineThumbView = true
            
            let strings = DummyDataSource.options()
            linearThumbViewSegmentedControl.setSegmentedWith(items: strings)
            linearThumbViewSegmentedControl.padding = 2
            linearThumbViewSegmentedControl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            linearThumbViewSegmentedControl.selectedTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            linearThumbViewSegmentedControl.thumbViewColor = #colorLiteral(red: 0.9411764706, green: 0.2549019608, blue: 0.6274509804, alpha: 1)
            
        }
    }
    
    //MARK 8
    @IBOutlet weak var colorsSegmentedControl: CustomSegmentedControl! {
        didSet {
            
            //Set this booleans to adapt control
            colorsSegmentedControl.itemsWithDynamicColor = true
            colorsSegmentedControl.fillEqually = false
            colorsSegmentedControl.roundedControl = true
            
            let colors = DummyDataSource.colorItems()
            colorsSegmentedControl.setSegmentedWith(items: colors)
            colorsSegmentedControl.imageForItemWithDynamicColors = UIImage(named: "vignette")
            colorsSegmentedControl.padding = 2
            colorsSegmentedControl.thumbViewColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            colorsSegmentedControl.animationDuration = 0.2
            colorsGenericViewModel = GenericViewModel<UIColor>(items: colors)
            
        }
    }
    
    //MARK: Example of how to use it as an action
    @IBAction func changeBackGroundColor(_ sender: CustomSegmentedControl) {
        
        let backGroundColor = colorsGenericViewModel?.getItem(at: sender.selectedSegmentIndex)
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = backGroundColor
        }
    }
    
    //MARK: Example of how to use to update the content
    var update = false

    @IBAction func showExampleOfUpdate(_ sender: UIButton) {
        update = !update

        let colors = !update ? DummyDataSource.colorItems() : DummyDataSource.moreColorItems()
        self.colorsSegmentedControl.updateSegmentedWith(items: colors)
        //NOTE important to update the viewModel also with new items or app will crash because the index could be out of bounds
        self.colorsGenericViewModel?.update(items: colors)
    }
    
    @IBAction func updateTextControl(_ sender: UIButton) {
        update = !update
        let titles = !update ? DummyDataSource.textItems() : DummyDataSource.options()

        self.linearThumbViewSegmentedControl.updateSegmentedWith(items: titles)
    
    }
    
}
















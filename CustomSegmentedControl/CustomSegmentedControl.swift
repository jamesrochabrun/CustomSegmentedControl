//
//  CustomSegmentedControl.swift
//  CustomSegmentedControl
//
//  Created by James Rochabrun on 9/2/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//


import Foundation
import UIKit

@IBDesignable

/*
 Documentation
 
 1 - if selector contains texts set:
 
 segmentedControl.setSelectorWith(titles: [String])
 itemsWithText = true
 circleSelector = true/false depending on the lenght of text, suggest set to false to give mnore space to text
 
 2 - if selector contains images set:
 
 segmentedControl.setSelectorWith(images: [image])
 itemsWithText = false
 circleSelector = true/false depending on design
 buttonColorForNormal and buttonColorForSelected
 
 and set the
 
 3 - if selector contains images that are different set:
 
 segmentedControl.setSelectorWith(images: [image])
 itemsWithText = false
 buttonsWithDynamicImages = true
 
 //this will change the image based on the index
 
 4 - if selector needs to change color set
 
 segmentedControl.setSelectorWith(colors: [UIColor])
 itemsWithText = false
 circleSelector = true/false depending on design
 itemsWithDynamicColor = true
 imageForItemWithDynamicColors = image that wil change color
 
 */

class CustomSegmentedControl: UIControl {
    
    //static properties
    //Set to 10 by default, if setted to 0 the image will be same size at button
    static let imageInsets: UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    
    //Private properties
    fileprivate var buttons = [UIButton]()
    fileprivate var thumbView: UIView = {
        return UIView()
    }()
    
    @IBInspectable private var buttonImages: [UIImage] = [] {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable private var buttonTitles: [String] = [] {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable private var buttonColors: [UIColor] = [] {
        didSet {
            updateView()
        }
    }
    
    //the buttons cant be smaller than 0.6 or scale bigger that 1.0
    @IBInspectable public var scaleForButtonsWithCircleSelector: CGFloat {
        get {
            return self.privateButtonsScaleForCircleSelector
        }
        set {
            if newValue > 1.0 || newValue < 0.6 {
                privateButtonsScaleForCircleSelector = 1.0
            } else {
                privateButtonsScaleForCircleSelector = newValue
            }
        }
    }
    
    private var privateButtonsScaleForCircleSelector: CGFloat = 1.0 {
        didSet {
            self.layoutSubviews()
        }
    }
    
    //Public properties customize segmented control
    var selectedSegmentIndex = 0
    
    @IBInspectable var customBorderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = customBorderWidth
        }
    }
    
    @IBInspectable var customBorderColor: UIColor = .clear {
        didSet {
            layer.borderColor = customBorderColor.cgColor
        }
    }
    
    //segmented
    @IBInspectable var segmentedBackGroundColor: UIColor = .white {
        didSet {
            self.backgroundColor = segmentedBackGroundColor
        }
    }
    
    //thumbView
    @IBInspectable var thumbViewColor: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
    
    //If text
    @IBInspectable var textColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectedTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    public var titlesFont: UIFont? {
        didSet {
            updateView()
        }
    }
    
    //if images
    @IBInspectable var buttonColorForNormal: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var buttonColorForSelected: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
    
    //if buttons have dynamicImages means an array of images and wants to display one as selected on selection
    @IBInspectable var buttonsWithDynamicImages: Bool = false {
        didSet {
            updateView()
        }
    }
    
    //if buttons have dynamic colors
    @IBInspectable public var itemsWithDynamicColor: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    @IBInspectable var imageForItemWithDynamicColors: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var padding: CGFloat = 0 {
        didSet {
            self.updateView()
        }
    }
    
    //main properties for customize segmented, if items contains text is recommended to set the circleSelector to false
    public var circleSelector: Bool = true {
        didSet {
            self.layoutSubviews()
        }
    }
    
    public var itemsWithText: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    //MARK: Update selector with data
    func setSelectorWith(images: [UIImage]) {
        self.buttonImages = images
    }
    
    func setSelectorWith(titles: [String]) {
        self.buttonTitles = titles
    }
    
    func setSelectorWith(colors: [UIColor]) {
        self.buttonColors = colors
    }
    
    //1 reset all views to clean state
    private func resetViews() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    //2 update the UI based on text/ images or colors
    private func updateView() {
        
        resetViews()
        self.clipsToBounds = false
        addSubview(thumbView)
        if itemsWithDynamicColor {
            setButtonsWithDynamicColors()
        } else {
            itemsWithText ? setButtonsWithText() : setButtonsWithImages()
        }
        if circleSelector {
            let _ = self.buttons.map { addSubview($0) }
        } else {
            self.layoutButtonsOnStackView()
        }
    }
    
    //3 if selector is not circled layout buttons on stackview
    private func layoutButtonsOnStackView() {
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        addSubview(sv)
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sv.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        sv.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    //4 layout subviews based on frames
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
        self.backgroundColor = self.segmentedBackGroundColor
        self.layer.borderColor = self.segmentedBackGroundColor.cgColor
        setSelector()
        //if circleSelector is true the layout is not in stackview
        guard circleSelector else { return }
        for (index, btn) in self.buttons.enumerated() {
            btn.frame = setFrameForButtonAt(index: index)
        }
    }
    
    //MARK: Helpers
    //set frame of selector
    private func setSelector() {
        
        let selectorHeight = bounds.height - padding * 2
        let selectorWidth = circleSelector ? selectorHeight : (bounds.width / CGFloat(buttons.count)) - padding * 2
        let selectorPositionX = padding
        let selectorPositionY = (bounds.height - selectorHeight) / 2
        
        thumbView.frame = CGRect(x: selectorPositionX, y: selectorPositionY, width: selectorWidth, height: selectorHeight)
        
        thumbView.layer.cornerRadius = selectorHeight / 2
        thumbView.backgroundColor = thumbViewColor
    }
    
    //called if boolean for text is true
    private func setButtonsWithText() {
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = titlesFont
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
            //set the one that we want to show as selected by default
            buttons[selectedSegmentIndex].setTitleColor(selectedTextColor, for: .normal)
        }
    }
    
    //called if boolean for text is false
    private func setButtonsWithImages() {
        
        for buttonImage in self.buttonImages {
            
            var button: UIButton?
            if !buttonsWithDynamicImages {
                button = UIButton(type: .system)
                button?.tintColor = buttonColorForNormal
            } else {
                button = UIButton(type: .custom)
            }
            button?.setImage(buttonImage, for: .normal)
            button?.imageEdgeInsets = CustomSegmentedControl.imageInsets
            button?.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button!)
            if !buttonsWithDynamicImages {
                buttons[selectedSegmentIndex].tintColor = buttonColorForSelected
            }
        }
    }
    
    //called if boolean for dynamic colors in buttons is true
    private func setButtonsWithDynamicColors() {
        
        for btnColor in self.buttonColors {
            let button = UIButton(type: .system)
            button.tintColor = btnColor
            if let image = self.imageForItemWithDynamicColors {
                button.setImage(image, for: .normal)
            }
            button.imageEdgeInsets = CustomSegmentedControl.imageInsets
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
    }
    
    //MARK set frame for each button if selector is circled
    private func setFrameForButtonAt(index: Int) -> CGRect {
        
        var frame = CGRect.zero
        
        //1 identify the height of each button
        let buttonHeight = (bounds.height - padding * 2) * privateButtonsScaleForCircleSelector
        //2 set it's height for circle look and centered position Y
        let buttonWidth = buttonHeight
        let selectorPositionY = (bounds.height - buttonHeight) / 2
        
        //3 get the delta for scaled buttons
        let paddingForScale: CGFloat = (thumbView.frame.height - buttonHeight) / 2
        
        //set first and last elements origin x
        let firstelementPositionX = self.padding + paddingForScale
        let lastElemetPositionX = bounds.width - thumbView.frame.width - padding + paddingForScale
        
        //MARK Start here to modify the items from the second until the one befor the last
        //the area where the selector is contained
        let selectorAreaTotalWidth = bounds.width / CGFloat(buttons.count)
        //startingPoint based on x position multiplier
        let startingPointAtIndex = selectorAreaTotalWidth *  CGFloat(index)
        //the remaining space of a selectorArea based on selector width
        let originXForNextItem = (selectorAreaTotalWidth - thumbView.bounds.width) / 2
        //dynamically change the origin x of the items between 0 and lastItem
        let selectedStartPositionForCircleSelector = startingPointAtIndex + originXForNextItem + paddingForScale
        
        if index == 0 {
            
            frame = CGRect(x: firstelementPositionX, y: selectorPositionY, width: buttonWidth, height: buttonHeight)
        } else if index == self.buttons.count - 1 {
            frame = CGRect(x: lastElemetPositionX, y: selectorPositionY, width: buttonWidth, height: buttonHeight)
        } else {
            frame = CGRect(x: selectedStartPositionForCircleSelector, y: selectorPositionY, width: buttonWidth, height: buttonHeight)
        }
        return frame
    }
}

//MARK: Actions
extension CustomSegmentedControl {
    
    //MAIN action on button tapped
    @objc fileprivate func buttonTapped(button: UIButton) {
        
        for (btnIndex, btn) in self.buttons.enumerated() {
            
            btn.setTitleColor(textColor, for: .normal)
            if !itemsWithDynamicColor {
                if !buttonsWithDynamicImages {
                    btn.tintColor = buttonColorForNormal
                }
            }
            if btn == button {
                selectedSegmentIndex = btnIndex
                circleSelector ? moveCircleSelectorAt(index: btnIndex) : moveSelectorAt(index: btnIndex)
                btn.setTitleColor(selectedTextColor, for: .normal)
                
                if !itemsWithDynamicColor {
                    if !buttonsWithDynamicImages {
                        btn.tintColor = buttonColorForSelected
                    }
                }
            }
        }
        sendActions(for: .valueChanged)
    }
    
    //Movement for selector that its not circle
    fileprivate func moveSelectorAt(index: Int) {
        
        let selectedStartPosition = index == 0 ? self.padding : bounds.width / CGFloat(buttons.count) *  CGFloat(index) + self.padding
        UIView.animate(withDuration: 0.3, animations: {
            self.thumbView.frame.origin.x = selectedStartPosition
        })
    }
    
    //Movement for circle selector
    fileprivate func moveCircleSelectorAt(index: Int) {
        
        let firstelementPositionX = self.padding
        let lastElemetPositionX = bounds.width - thumbView.frame.width - padding
        
        //the area where the selector is contained
        let selectorAreaTotalWidth = bounds.width / CGFloat(buttons.count)
        //startingPoint based on x position multiplier
        let startingPointAtIndex = selectorAreaTotalWidth *  CGFloat(index)
        //the remaining space of a selectorArea based on selector width
        let originXForNextItem = (selectorAreaTotalWidth - thumbView.bounds.width) / 2
        //dynamically change the origin x of the items between 0 and lastItem
        let selectedStartPositionForCircleSelector = startingPointAtIndex + originXForNextItem
        
        UIView.animate(withDuration: 0.3, animations: {
            
            if index == 0 {
                self.thumbView.frame.origin.x = firstelementPositionX
            } else if index == self.buttons.count - 1 {
                self.thumbView.frame.origin.x = lastElemetPositionX
            } else {
                self.thumbView.frame.origin.x = selectedStartPositionForCircleSelector
            }
        })
    }
}

//MARK: Generic viewmodel that accepts an array of T

struct KMCustomSegmentedControlViewModel<T> {
    
    private var itemsForSelection: [T]
    
    init(items: [T]) {
        self.itemsForSelection = items
    }
    
    func getItem(at index: Int) -> T {
        return self.itemsForSelection[index]
    }
}



























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
 fillEqually = true/false depending on the lenght of text, suggest set to true to give mnore space to text
 
 2 - if selector contains images set:
 
 segmentedControl.setSelectorWith(images: [image])
 itemsWithText = false
 fillEqually = true/false depending on design
 buttonColorForNormal and buttonColorForSelected
 
 and set the
 
 3 - if selector contains images that are different and dont want to change its tintColor on selection set:
 
 segmentedControl.setSelectorWith(images: [image])
 itemsWithText = false
 buttonsWithDynamicImages = true
 Note - do not set itemsWithDynamicColor to true here that will make buttons not show on app
 
 //this will change the image based on the index
 
 4 - if selector needs to change color set
 
 segmentedControl.setSelectorWith(colors: [UIColor])
 itemsWithText = false
 fillEqually = true/false depending on design
 itemsWithDynamicColor = true
 imageForItemWithDynamicColors = image that wil change color
 
 */

class CustomSegmentedControl: UIControl {
    
    //static properties
    //Set to 10 by default, if setted to 0 the image will be same size at button
    static let imageInsets: UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    static let bottomLineThumbViewHeight: CGFloat = 5.0
    
    //Private UI properties
    fileprivate var buttons = [UIButton]()
    fileprivate var thumbView: UIView = {
        return UIView()
    }()
        
    //Private datasources
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
    
    //Public properties customize segmented control
    //change this public properties for customization
    
    //MARK: APPEREANCE
    var selectedSegmentIndex = 0

    @IBInspectable var padding: CGFloat = 0 {
        didSet {
            self.updateView()
        }
    }
    
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
    
    //animation duration is 0.3 by default
    @IBInspectable var animationDuration: CGFloat = 0.3
    @IBInspectable var thumbViewAlpha: CGFloat = 1.0 {
        didSet {
            self.thumbView.alpha = thumbViewAlpha
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
    
    //MARK: SEGMENTED CONTROL WITH TEXT
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
    
    //MARK: SEGMENTED CONTROL WITH IMAGES
    //if images with change on it's tint color on selection
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

    //MARK: SEGMENTED CONTROL WITH COLORS

    //this is just a placeholder it can be any type of images passed as parameter it will "hold" the color and present it
    @IBInspectable var imageForItemWithDynamicColors: UIImage? {
        didSet {
            updateView()
        }
    }
    
    //MARK: MAIN BOOLEANS FOR SET UICONTROL
    //main properties for customize segmented, if items contains text is recommended to set the fillEqually to true
    
    //A) Most important booleans are fillEqually - itemsWithText - roundedControl - bottomLineThumbView - thumbViewHidden
    public var fillEqually: Bool = false {
        didSet {
            self.layoutSubviews()
        }
    }
    
    //change the control for images and text
    public var itemsWithText: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    public var roundedControl: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    public var bottomLineThumbView: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    public var thumbViewHidden: Bool = false {
        didSet {
            self.thumbView.isHidden = thumbViewHidden
        }
    }
    
    //B) This makes changes on buttons with images and only if itemsWithText = false
    //if buttons have dynamicImages means if we want to show the image without changing its tintcolor
    //Setting this to true will make not buttonColorForNormal and buttonColorForSelected not been called
    @IBInspectable var buttonsWithDynamicImages: Bool = false {
        didSet {
            updateView()
        }
    }
    
    //C) This makes changes on buttons with colors and only if itemsWithText = false
    @IBInspectable public var itemsWithDynamicColor: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    //MARK: SET SEGMENTED CONTROL DATASOURCES
    
    func setSegmentedWith<T>(items: T) {
        if items is [String] {
            self.buttonTitles = items as! [String]
        } else if items is [UIImage] {
            self.buttonImages = items as! [UIImage]
        } else if items is [UIColor] {
            self.buttonColors = items as! [UIColor]
        }
    }
    
    //MARK: GENERIC METHOD FOR UPDATE DATASOURCES
    func updateSegmentedWith<T>(items: T) {
        
        self.buttonTitles.removeAll()
        self.buttonImages.removeAll()
        self.buttonColors.removeAll()
        self.thumbView.alpha = 0
        
        self.selectedSegmentIndex = 0
        self.setSegmentedWith(items: items)

        UIView.animate(withDuration: 0.4) {
            self.updateView()
            self.thumbView.alpha = 1
        }
        //if we want to update the view based on the new selectedSegmentedIndex
        self.performAction()
    }
    
    //MARK: METHODS THAT WILL CREATE THE CONTROL BASED ON CUSTOMIZATION OF PROPERTIES
    
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
        if fillEqually {
            self.layoutButtonsOnStackView()
        } else {
            let _ = self.buttons.map { addSubview($0) }
        }
    }
    
    //3 all UI layout based on frames must be called on layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = roundedControl ? frame.height / 2 : 1.0
        self.backgroundColor = self.segmentedBackGroundColor
        self.layer.borderColor = self.segmentedBackGroundColor.cgColor
        setThumbView()
        //if fillEqually is not true the layout is not in stackview and its set based on frames
        guard !fillEqually else { return }
        for (index, btn) in self.buttons.enumerated() {
            btn.frame = setFrameForButtonAt(index: index)
        }
    }
    
    //MARK: THUMBVIEW LAYOUT
    private func setThumbView() {

        let thumbViewHeight = bottomLineThumbView ? CustomSegmentedControl.bottomLineThumbViewHeight : bounds.height - padding * 2
        let thumbViewWidth = fillEqually ? (bounds.width / CGFloat(buttons.count)) - padding * 2 : bounds.height - padding * 2
        let thumbViewPositionX = padding
        let thumbViewPositionY = bottomLineThumbView ? bounds.height - thumbViewHeight - padding : (bounds.height - thumbViewHeight) / 2
        
        thumbView.frame = CGRect(x: thumbViewPositionX, y: thumbViewPositionY, width: thumbViewWidth, height: thumbViewHeight)
        thumbView.layer.cornerRadius = roundedControl ? thumbViewHeight / 2 : 1.0
        thumbView.backgroundColor = thumbViewColor
    }
    
    //4 MARK: BUTTONS LAYOUTS
    // if fillEqualy = true
    private func layoutButtonsOnStackView() {
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        addSubview(sv)
        
        NSLayoutConstraint.activate([
            sv.topAnchor.constraint(equalTo: topAnchor),
            sv.bottomAnchor.constraint(equalTo: bottomAnchor),
            sv.trailingAnchor.constraint(equalTo: trailingAnchor),
            sv.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])
    }
    
    //if fillEqually = false
    private func setFrameForButtonAt(index: Int) -> CGRect {
        
        var frame = CGRect.zero
        
        //1 identify the height of each button
        let buttonHeight = (bounds.height - padding * 2)
        //2 set it's height for circle/square look and centered position Y
        let buttonWidth = buttonHeight
        let thumbViewPositionY = (bounds.height - buttonHeight) / 2

        //set first and last elements origin x
        let firstelementPositionX = self.padding
        let lastElemetPositionX = bounds.width - thumbView.frame.width - padding
        //MARK Start here to modify the items from the second until the one before the last
        //the area where the thumbView is contained
        let thumbViewAreaTotalWidth = bounds.width / CGFloat(buttons.count)
        //startingPoint based on x position multiplier
        let startingPointAtIndex = thumbViewAreaTotalWidth *  CGFloat(index)
        //the remaining space of a selectorArea based on selector width
        let originXForNextItem = (thumbViewAreaTotalWidth - thumbView.bounds.width) / 2
        //dynamically change the origin x of the items between 0 and lastItem
        let selectedStartPositionForNotEquallyFill = startingPointAtIndex + originXForNextItem 
        
        if index == 0 {
            frame = CGRect(x: firstelementPositionX, y: thumbViewPositionY, width: buttonWidth, height: buttonHeight)
        } else if index == self.buttons.count - 1 {
            frame = CGRect(x: lastElemetPositionX, y: thumbViewPositionY, width: buttonWidth, height: buttonHeight)
        } else {
            frame = CGRect(x: selectedStartPositionForNotEquallyFill, y: thumbViewPositionY, width: buttonWidth, height: buttonHeight)
        }
        return frame
    }
    
    //called if boolean for text is true
    private func setButtonsWithText() {
        
        guard self.buttonTitles.count != 0 else { return }
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = titlesFont
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
            //set the one that we want to show as selected by default
        }
        buttons[selectedSegmentIndex].setTitleColor(selectedTextColor, for: .normal)
    }
    
    //called if boolean for text is false
    private func setButtonsWithImages() {
        
        guard self.buttonImages.count != 0 else { return }

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
        }
        if !buttonsWithDynamicImages {
            buttons[selectedSegmentIndex].tintColor = buttonColorForSelected
        }
    }
    
    //called if boolean for dynamic colors in buttons is true
    private func setButtonsWithDynamicColors() {
        
        guard self.buttonColors.count != 0 else { return }
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
}

//MARK: ACTIONS WHEN ITEM IS SELECTED IT HANDLES: ACTION - APPEREANCE - TRANSLATION
extension CustomSegmentedControl {
    
    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }
    
    //MARK: CHANGING APPEREANCE OF BUTTON ON TAP
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
                fillEqually ?  moveThumbView(at: btnIndex) : moveThumbViewFillEquallyFalse(at: btnIndex)
                btn.setTitleColor(selectedTextColor, for: .normal)
                if !itemsWithDynamicColor {
                    if !buttonsWithDynamicImages {
                        btn.tintColor = buttonColorForSelected
                    }
                }
            }
        }
        self.performAction()
    }
    
    //MARK: TRANSLATION OF THUMBVIEW WITH ANIMATION ON TAP
    
    //Movement of thumbview if fillEqually = true
    fileprivate func moveThumbView(at index: Int) {
        
        let selectedStartPosition = index == 0 ? self.padding : bounds.width / CGFloat(buttons.count) *  CGFloat(index) + self.padding
        UIView.animate(withDuration: TimeInterval(self.animationDuration), animations: {
            self.thumbView.frame.origin.x = selectedStartPosition
        })
    }
    
    //Movement of thumbview if fillEqually = false
    fileprivate func moveThumbViewFillEquallyFalse(at index: Int) {
        
        let firstelementPositionX = self.padding
        let lastElemetPositionX = bounds.width - thumbView.frame.width - padding
        
        //the area where the selector is contained
        let selectorAreaTotalWidth = bounds.width / CGFloat(buttons.count)
        //startingPoint based on x position multiplier
        let startingPointAtIndex = selectorAreaTotalWidth *  CGFloat(index)
        //the remaining space of a selectorArea based on selector width
        let originXForNextItem = (selectorAreaTotalWidth - thumbView.bounds.width) / 2
        //dynamically change the origin x of the items between 0 and lastItem
        let selectedStartPositionForNotEquallyFill = startingPointAtIndex + originXForNextItem
        
        UIView.animate(withDuration: TimeInterval(self.animationDuration), animations: {
            
            if index == 0 {
                self.thumbView.frame.origin.x = firstelementPositionX
            } else if index == self.buttons.count - 1 {
                self.thumbView.frame.origin.x = lastElemetPositionX
            } else {
                self.thumbView.frame.origin.x = selectedStartPositionForNotEquallyFill
            }
        })
    }
}



























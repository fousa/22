//
//  FUYearPickerView.swift
//  22
//
//  Created by Jelle Vandenbeeck on 08/10/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

class FUYearPickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private let minimumUsableAge = 14
    
    lazy var years: [Int] = {
        [unowned self] in
        
        var year = NSCalendar(identifier: NSCalendarIdentifierGregorian)!.component(.Year, fromDate: NSDate()) - self.minimumUsableAge
        var years: [Int] = []
        for _ in 1...100 {
            years.append(year)
            year--
        }
        return years
    }()
    
    var selectedYear: Int {
        get {
            return years[selectedRowInComponent(0)]
        }
        set {
            selectRow(row(year: newValue), inComponent: 0, animated: false)
        }
    }
    
    // MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
                
        delegate = self
        dataSource = self
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 35
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributes = [
            NSForegroundColorAttributeName : UIColor(red:0, green:0.66, blue:0.62, alpha:1),
            NSFontAttributeName : UIFont.systemFontOfSize(26.0, weight: UIFontWeightLight)
        ]
        return NSAttributedString(string: String(years[row]), attributes: attributes)
    }
    
    // MARK: - UIPickerViewDataSourceUIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    // MARK: - Years
    
    private func row(year year: Int) -> Int {
        return years.indexOf(year) ?? 0
    }
    
    // MARK: - Drawing
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor(red:0, green:0.66, blue:0.62, alpha:1).CGColor)
        let offset: CGFloat = 38
        CGContextStrokeRect(context, CGRectMake(-10.0, CGRectGetMidY(rect) - offset / 2.0, rect.size.width + 10.0, offset))
    }
    
}
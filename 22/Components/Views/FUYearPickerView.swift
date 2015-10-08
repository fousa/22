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
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(years[row])
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
}
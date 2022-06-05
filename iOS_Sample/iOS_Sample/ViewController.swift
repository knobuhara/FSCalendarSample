//
//  ViewController.swift
//  iOS_Sample
//
//  Created by KNobuhara on 6/5/4 R.
//  Copyright © 4 Reiwa KNobuhara. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    @IBOutlet weak var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.calendar.dataSource = self
        self.calendar.delegate = self
        calendar.setScope(.week, animated: true)
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
//        labelDate.text = "\(year)/\(month)/\(day)"
        
            
        let storyborad: UIStoryboard = self.storyboard!
         
        let nextView = storyborad.instantiateViewController(
                withIdentifier: "setting")as! SettingViewController
        self.present(nextView, animated: true, completion: nil)
        nextView.updateString("\(year)/\(month)/\(day)")
    }
}
 


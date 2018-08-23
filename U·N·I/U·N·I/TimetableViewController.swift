//
//  TimetableViewController.swift
//  U·N·I
//
//  Created by Luke Menzel on 14/05/2018.
//  Copyright © 2018 Luke Menzel. All rights reserved.
//

import UIKit
import JTAppleCalendar

class TimetableViewController: UIViewController, UIScrollViewDelegate {
    
    let formatter = DateFormatter()

    var views: [UIView]!
     @IBOutlet weak var ViewController: UIView!
    @IBAction func SwitchViewAction(_ sender: UISegmentedControl) {
        self.ViewController.bringSubview(toFront: views[sender.selectedSegmentIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        views = [UIView] ()
        views.append(DayViewController().view)
        views.append(MonthViewController().view)
        
        for v in views {
            ViewController.addSubview(v)
        }
        ViewController.bringSubview(toFront: views[0])
    }
    
}

extension TimetableViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    }
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2018 06 26")!
        let endDate = formatter.date(from: "2019 06 26")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        return cell
    }
}
    






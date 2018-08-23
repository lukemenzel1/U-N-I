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
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    let formatter = DateFormatter()

    var views: [UIView]!
     @IBOutlet weak var ViewController: UIView!
    @IBAction func SwitchViewAction(_ sender: UISegmentedControl) {
        self.ViewController.bringSubview(toFront: views[sender.selectedSegmentIndex])
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupCalendarView()

    }
    func setupCalendarView() {
        calendarView.minimumInteritemSpacing = 0
        calendarView.minimumLineSpacing = 0
    }
}

extension TimetableViewController: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2018 06 26")!
        let endDate = formatter.date(from: "2019 06 26")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
}

extension TimetableViewController: JTAppleCalendarViewDelegate {
    //display the cell
        func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
            let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
            cell.dateLabel.text = cellState.text
            if cellState.isSelected {
                cell.selectedView.isHidden = false
            } else {
                cell.selectedView.isHidden = true
            }
            return cell
            }
        func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    }
func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
    guard let validCell = cell as? CustomCell else { return }
    validCell.selectedView.isHidden = false
        
    }
    
func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
    guard let validCell = cell as? CustomCell else { return }
    validCell.selectedView.isHidden = true
    }

}












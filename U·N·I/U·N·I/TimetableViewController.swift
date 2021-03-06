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
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var year: UILabel!
    
    
    let formatter = DateFormatter()
    let dayColour = UIColor.black
    let selectedDayColour = UIColor.cyan
    let daysOutsideMonthColour = UIColor.lightGray
    

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
        
        calendarView.visibleDates { visibleDates  in
           self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    
    func handleCellTextColour(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
        if cellState.isSelected {
            validCell.dateLabel.textColor = selectedDayColour
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = dayColour
            }
            else {
                validCell.dateLabel.textColor = daysOutsideMonthColour
            }
        }
    }
    
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.year.text = formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.month.text = formatter.string(from: date)
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
            
            handleCellSelected(view: cell, cellState: cellState)
            handleCellTextColour(view: cell, cellState: cellState)
            return cell
            }
        func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    }
func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
    guard let validCell = cell as? CustomCell else { return }
    validCell.selectedView.isHidden = false
      handleCellTextColour(view: cell, cellState: cellState)
        
    }
    
func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
    guard let validCell = cell as? CustomCell else { return }
    validCell.selectedView.isHidden = true
      handleCellTextColour(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        formatter.dateFormat = "yyyy"
        year.text = formatter.string(from: date)
        
        formatter.dateFormat = "MMMM"
        month.text = formatter.string(from: date)
    }

}














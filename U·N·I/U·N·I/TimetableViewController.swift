//
//  TimetableViewController.swift
//  U·N·I
//
//  Created by Luke Menzel on 14/05/2018.
//  Copyright © 2018 Luke Menzel. All rights reserved.
//

import UIKit
import JTAppleCalendar
import FBSDKCoreKit

class TimetableViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var year: UILabel!
    
    
    let formatter = DateFormatter()
    let monthColour = UIColor.black
    let selectedMonthColour = UIColor.cyan
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
    
    // setup the calendar spacing
    func setupCalendarView() {
        calendarView.minimumInteritemSpacing = 0
        calendarView.minimumLineSpacing = 0
        
        //setup labels
        calendarView.visibleDates { (visibleDates) in
            let date = visibleDates.monthDates.first!.date
            
            self.formatter.dateFormat = "yyyy"
            self.year.text = self.formatter.string(from: date)
            
            self.formatter.dateFormat = "MMMM"
            self.month.text = self.formatter.string(from: date)
            
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
    
    func handleCellTextColour(view: JTAppleCell?, cellState: CellState) {
         guard let validCell = view as? CustomCell else { return }
        
        if cellState.isSelected {
            validCell.dateLabel.textColor = selectedMonthColour
        }
        else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = monthColour
            }
            else {
                validCell.dateLabel.textColor = daysOutsideMonthColour
            }
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.year.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.month.text = self.formatter.string(from: date)
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
    
     //updates cell colour when Selected
        func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
            handleCellSelected(view: cell, cellState: cellState)
            handleCellTextColour(view: cell, cellState: cellState)
        
        }

    //updates cell colour when deselected
    
        func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
            handleCellSelected(view: cell, cellState: cellState)
            handleCellTextColour(view: cell, cellState: cellState)
        }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
        }

}












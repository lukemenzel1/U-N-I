 //
//  EventViewController.swift
//  U·N·I
//
//  Created by Luke Menzel on 14/05/2018.
//  Copyright © 2018 Luke Menzel. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    @IBOutlet weak var EndDateField: UITextField!
    @IBOutlet weak var StartDateField: UITextField!
    
    let StartPicker = UIDatePicker()
    let EndPicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createStartDatePicker()
        createEndDatePicker()
    }
    
    func createStartDatePicker() {
        //Toolbar 
        let StartToolbar = UIToolbar()
        StartToolbar.sizeToFit()
        
        //done button for toolbar 
        let StartDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(StartDateSelected))
        StartToolbar.setItems([StartDone], animated: false)
        
        StartDateField.inputAccessoryView = StartToolbar
        StartDateField.inputView = StartPicker
        
        //format picker for date 
        
        StartPicker.datePickerMode = .dateAndTime
    }
    
    @objc func StartDateSelected(){
        
        //format date
        let StartFormatter = DateFormatter()
        StartFormatter.dateStyle = .long
        StartFormatter.timeStyle = .short
        StartFormatter.timeZone = .none
        let StartDateString = StartFormatter.string(from: StartPicker.date)
        
        
        StartDateField.text = "\(StartDateString)"
        self.view.endEditing(true)
        
    }
    
    func createEndDatePicker(){
        
        let EndToolbar = UIToolbar()
        EndToolbar.sizeToFit()
        
        let EndDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(EndDateSelected))
        EndToolbar.setItems([EndDone], animated: false)
        
        EndDateField.inputAccessoryView = EndToolbar
        EndDateField.inputView = EndPicker
        
        StartPicker.datePickerMode  = .dateAndTime
    }
    
    @objc func EndDateSelected(){
        
        let EndFormatter = DateFormatter()
        EndFormatter.dateStyle = .long
        EndFormatter.timeStyle = .short
        EndFormatter.timeZone = .none
        let EndDateString = EndFormatter.string(from: EndPicker.date)
        
        EndDateField.text = "\(EndDateString)"
        self.view.endEditing(true)
    }
 }

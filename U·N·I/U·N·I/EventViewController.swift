 //
//  EventViewController.swift
//  U·N·I
//
//  Created by Luke Menzel on 14/05/2018.
//  Copyright © 2018 Luke Menzel. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class EventViewController: UIViewController {
    
    @IBOutlet weak var LocationText: UITextField!
    @IBOutlet weak var TitleText: UITextField!
    @IBOutlet weak var EndDateField: UITextField!
    @IBOutlet weak var StartDateField: UITextField!
    
    let StartPicker = UIDatePicker()
    let EndPicker = UIDatePicker()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        configureTextFields()
        createStartDatePicker()
        createEndDatePicker()
        configureTapGesture()
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
    
    //configuring the textfields
    private func configureTextFields() {
        TitleText.delegate = self
        LocationText.delegate = self
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EventViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        print("handle tap was called")
        view.endEditing(true)
    }
 }
 
 extension EventViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        }
    }


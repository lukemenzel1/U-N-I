//
//  TimetableViewController.swift
//  U·N·I
//
//  Created by Luke Menzel on 14/05/2018.
//  Copyright © 2018 Luke Menzel. All rights reserved.
//

import UIKit

class TimetableViewController: UIViewController, UIScrollViewDelegate {

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

//
//  TimetableViewController.swift
//  U·N·I
//
//  Created by Luke Menzel on 14/05/2018.
//  Copyright © 2018 Luke Menzel. All rights reserved.
//

import UIKit

class TimetableViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var PageView: UIPageControl!
    @IBOutlet weak var HorizontalScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for image in 0...2 {
            let imageToDisplay = UIImage(named: "\(image).png")
            let imageView = UIImageView(image: imageToDisplay)
            
            
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(image)
            
            HorizontalScroll.addSubview(imageView)
            
            imageView.frame = CGRect(x: xCoordinate, y: view.frame.height / 2, width: 100, height: 100)
        }
    

    }
}

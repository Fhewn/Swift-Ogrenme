//
//  ViewController.swift
//  Timer
//
//  Created by Fhewn on 15.10.2025.
//

import UIKit

class ViewController: UIViewController {

var timer = Timer()
var counter = 0
    
    @IBOutlet weak var lblTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 10
        lblTime.text = "Time \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction()
    {
        lblTime.text = "Time \(counter)"
        counter -= 1
        if counter == 0
        {
            timer.invalidate()
            lblTime.text = "Time's Over"
        }
    }

    @IBAction func btnClicked(_ sender: Any) {
        print("Button Clicked")
    }
}


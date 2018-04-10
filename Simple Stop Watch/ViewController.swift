//
//  ViewController.swift
//  Simple Stop Watch
//
//  Created by 김종현 on 2018. 4. 9..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    var count = 0
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       //myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()})
    }

    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }

    @IBAction func start(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()}) //스탑워치 실행
    }
    @IBAction func stop(_ sender: Any) {
        myTimer.invalidate()    //스탑워치 중지
    }
    @IBAction func reset(_ sender: Any) {
        count = 0
        myTimer.invalidate()
        timeLabel.text = "00:00:00" //스탑워치 초기화
    }
}


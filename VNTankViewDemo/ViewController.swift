//
//  ViewController.swift
//  VNTankViewDemo
//
//  Created by Varun Naharia on 28/11/17.
//  Copyright © 2017 Varun Naharia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tankView: VNTankView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        tankView.percent = slider.value
    }
    
}


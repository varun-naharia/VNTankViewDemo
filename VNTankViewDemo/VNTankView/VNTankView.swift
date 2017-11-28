//
//  VNTankView.swift
//  VNTankViewDemo
//
//  Created by Varun Naharia on 28/11/17.
//  Copyright © 2017 Varun Naharia. All rights reserved.
//

import UIKit
@IBDesignable
class VNTankView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tankView: VNTank!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate var tankFillColor:UIColor!
    fileprivate var fillPercentage:CGFloat = 0.0
    
    @IBInspectable var percent:Float
    {
        set
        {
            fillPercentage = CGFloat(newValue)
            tankView.percentage = 1-fillPercentage
        }
        get
        {
            return Float(fillPercentage)
        }
        
    }
    
    @IBInspectable var fillColor:UIColor
    {
        set{
            tankFillColor = newValue
            if(tankView != nil)
            {
                tankView.fillColor = tankFillColor
            }
        }
        get{
            return tankFillColor
        }
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("VNTankView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        contentView.isOpaque = false
        self.isOpaque = false
        updateView()
    }
    
    func updateView() {
        tankView.layer.borderColor = UIColor.white.cgColor
        tankView.layer.borderWidth = 4
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        tankView.layer.cornerRadius = tankView.frame.width/2
    }
    
   
}

class VNTank: UIView {
    var fillColor:UIColor = UIColor.blue
    var percentage:CGFloat = 0.0
    override func draw(_ rect: CGRect) {
        super.draw(rect)
         //can declare as instance variable or globally which you get from web service and set it's value!!
        let upperRect = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: rect.size.height*percentage)//CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height*percentage)
        let lowerRect = CGRect(x: rect.origin.x, y: rect.origin.y + (rect.size.height * percentage), width: rect.size.width, height: rect.size.height*(1 - percentage))//CGRectMake(rect.origin.x, rect.origin.y + (rect.size.height * percentage), rect.size.width, rect.size.height * (1-percentage))
        
        UIColor.clear.set()
        UIRectFill(upperRect)
        fillColor.set()
        UIRectFill(lowerRect)
        self.layer.masksToBounds = true
    }
}

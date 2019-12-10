//
//  ProgressRingViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/10/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class ProgressRingViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = view.center
        
        
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        trackLayer.position = view.center
        
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.softBlue.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        shapeLayer.position = view.center
        
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        view.layer.addSublayer(shapeLayer)
    }
    
    
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // if-else statement to get to 100%
        basicAnimation.toValue = 0.33
        
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "basicString")
        
        DispatchQueue.main.async {
            self.percentageLabel.text = "33%"
        }
    }
    
    @IBAction func completeTwoButtonTapped(_ sender: Any) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // if-else statement to get to 100%
        basicAnimation.fromValue = 0.33
        basicAnimation.toValue = 0.66
        
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "basicString")
        
        DispatchQueue.main.async {
            self.percentageLabel.text = "66%"
        }
    }
    
    @IBAction func completeThreeButtonTapped(_ sender: Any) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // if-else statement to get to 100%
        basicAnimation.fromValue = 0.66
        basicAnimation.toValue = 1
        
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "basicString")
        
        DispatchQueue.main.async {
            self.percentageLabel.text = "100%"
        }
    }
    
    
} // END OF CLASS


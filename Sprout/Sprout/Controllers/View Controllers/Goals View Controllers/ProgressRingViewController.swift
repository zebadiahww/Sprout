//
//  ViewController.swift
//  ProgressRing
//
//  Created by Zebadiah Watson on 11/18/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class ProgressRingViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    
    var currentValue = 0.0
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateWheel(newValue: 0.44)
        
        view.addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            percentageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            percentageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        
        // track layer code
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 10, y: 10), radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        
        percentageLabel.layer.addSublayer(trackLayer)
        
        //shape layer code
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.softBlue.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        
        //shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        percentageLabel.layer.addSublayer(shapeLayer)
        
    }

    func animateWheel(newValue: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // if-else statement to get to 100%
        basicAnimation.fromValue = currentValue
        basicAnimation.toValue = newValue
        
        basicAnimation.duration = 1
        if currentValue < newValue {
            basicAnimation.fillMode = .forwards
        } else {
            basicAnimation.fillMode = .forwards
        }
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "basicString")
        
        currentValue = newValue
        
        DispatchQueue.main.async {
            self.percentageLabel.text = String(self.currentValue)
        }
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {

        animateWheel(newValue: 0.10)
    }
    
    @IBAction func completeTwoButtonTapped(_ sender: Any) {
        animateWheel(newValue: 0.44)
    }
    
    @IBAction func completeThreeButtonTapped(_ sender: Any) {
        animateWheel(newValue: 0.99)

    }

    
    
}// End of Class


//
//  ViewController.swift
//  ProgressRing
//
//  Created by Zebadiah Watson on 11/18/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        
        view.addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = view.center
        
        
        // track later code
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        trackLayer.position = view.center
        
        view.layer.addSublayer(trackLayer)
        
        //shape layer code
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        shapeLayer.position = view.center
        
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        view.layer.addSublayer(shapeLayer)
        
    }
    
    private func beginDownloadingFile() {
        print("attempting to download")
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


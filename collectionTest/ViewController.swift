//
//  ViewController.swift
//  collectionTest
//
//  Created by Minhas, Taalib (ELS-LON) on 15/09/2017.
//  Copyright © 2017 Minhas, Taalib (ELS-LON). All rights reserved.
//

import UIKit

let screenSize = UIScreen.main.bounds
var circleWidth = screenSize.width * 0.6
var circleHeight = circleWidth
let screenWidth = screenSize.width
let screenHeight = screenSize.height

class ViewController: UIViewController {
    
    
    // Create a new CircleView
    let circleView = Circle(frame: CGRect(x: ((screenWidth/2) - (circleWidth/2)), y: ((screenHeight/2) - (circleHeight/2)), width: circleWidth, height: circleHeight))
    
    //MARK: Circle view functions; start, pause, resume & reset
    
    func addCircleView() {
        
//        let screenSize = UIScreen.main.bounds
//        var circleWidth = screenSize.width * 0.6
//        var circleHeight = circleWidth
//        let screenWidth = screenSize.width
//        let screenHeight = screenSize.height
        
//        // Create a new CircleView
//        let circleView = Circle(frame: CGRect(x: ((screenWidth/2) - (circleWidth/2)), y: ((screenHeight/2) - (circleHeight/2)), width: circleWidth, height: circleHeight))
//        
//        view.addSubview(circleView)
        
        circleView.animateCircle(duration: 100.0)
        
    }
    
    func pauseAnimateCircle() -> Bool {
        if circleLayer.speed == 1.0 {
            let pausedTime = circleLayer.convertTime(CACurrentMediaTime(), from: nil)
            circleLayer.speed = 0.0
            circleLayer.timeOffset = pausedTime
            print (pausedTime)
            return true
        } else {
            return false
        }
        
    }
    
    func resume() {
        let pausedTime: CFTimeInterval = circleLayer.timeOffset
        circleLayer.speed = 1.0
        circleLayer.timeOffset = 0.0
        circleLayer.beginTime = 0.0
        let timeSincePause: CFTimeInterval = circleLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        circleLayer.beginTime = timeSincePause
        print (pausedTime)
        
    }

    func reset() {
        circleLayer.removeAllAnimations()
        circleLayer.transform = CATransform3DIdentity
        circleView.resetCircle(duration: 1.0)

    }
    
    //MARK: Action buttons for start, pause, resume & reset
    
    @IBAction func btn(_ sender: Any) {
        addCircleView()
        
    }
    
    
    @IBAction func pause(_ sender: Any) {
        pauseAnimateCircle()

    }
    
    
    @IBAction func resume(_ sender: Any) {
        resume()
    }
    
    
    @IBAction func reset(_ sender: Any) {
       
        if pauseAnimateCircle() == true {
            
            circleLayer.speed = 1.0
            reset()
            
        }  else {
        
        reset()
            
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        view.addSubview(circleView)
        
        circleView.loadCircle(duration: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


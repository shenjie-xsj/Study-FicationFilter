//
//  ViewController.swift
//  NumberTimer
//
//  Created by EU_ShenJie on 2018/8/3.
//  Copyright © 2018年 EU_ShenJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hourView1: UIView!
    @IBOutlet weak var hourView2: UIView!
    
    @IBOutlet weak var minuteView1: UIView!
    @IBOutlet weak var minuteView2: UIView!
    
    @IBOutlet weak var secondView1: UIView!
    @IBOutlet weak var secondView2: UIView!
    
    let image:CGImage = (UIImage(named: "Numbers")?.cgImage)!
    
    let Nums:[CGRect?] = [
        CGRect(x: 0.04261363636, y: 0.22395833333, width: 0.05776515152, height: 0.53125),
        CGRect(x: 0.13825757576, y: 0.22395833333, width: 0.05776515152, height: 0.53125),
        CGRect(x: 0.23484848485, y: 0.22395833333, width: 0.05776515152, height: 0.53125),
        CGRect(x: 0.33049242424, y: 0.22395833333, width: 0.05776515152, height: 0.53125),
        CGRect(x: 0.42613636364, y: 0.22395833333, width: 0.05776515152, height: 0.53125),
        CGRect(x: 0.52272727273, y: 0.22395833333, width: 0.05776515152, height: 0.53125),
        CGRect(x: 0.61837121212, y: 0.22395833333, width: 0.05776515152, height: 0.53125),
        CGRect(x: 0.71496323232, y: 0.22395833333, width: 0.05776515152, height: 0.53125),
        CGRect(x: 0.81060606061, y: 0.22395833333, width: 0.05776515152, height: 0.53125),
        CGRect(x: 0.90719696969, y: 0.22395833333, width: 0.05776515152, height: 0.53125)
    ]
    
    //定时器
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        tick()
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(1.0), target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }

    @objc func tick() {
        let calendar = Calendar.current
        let dateComponets = calendar.dateComponents(in: TimeZone.current, from: Date())
        let hour = dateComponets.hour!
        let minute = dateComponets.minute!
        let second = dateComponets.second!
        
        secondView2.layer.contentsRect = Nums[second%10]!
        secondView1.layer.contentsRect = Nums[Int(second/10)]!
        
        minuteView2.layer.contentsRect = Nums[minute%10]!
        minuteView1.layer.contentsRect = Nums[Int((minute/10))]!
        
        hourView2.layer.contentsRect = Nums[hour%10]!
        hourView1.layer.contentsRect = Nums[Int(hour/10)]!
        
        print("\(hour):\(minute):\(second)")
    }
    
    private func setView() {
        setContent(toView: hourView1,fromRect: Nums[8]!)
        setContent(toView: hourView2,fromRect: Nums[9]!)
        
        setContent(toView: minuteView1,fromRect: Nums[0]!)
        setContent(toView: minuteView2,fromRect: Nums[0]!)
        
        setContent(toView: secondView1,fromRect: Nums[0]!)
        setContent(toView: secondView2,fromRect: Nums[0]!)
    
    }
    
    private func setContent(toView:UIView,fromRect:CGRect) {
        toView.layer.contents = image
        toView.layer.contentsGravity = kCAGravityCenter
        toView.layer.contentsRect = fromRect
        toView.layer.contentsScale = 0.5
        
        //解决图像拉伸时的模糊问题
        //toView.layer.magnificationFilter = kCAFilterLinear
        //换成下面这句渲染出来更清晰一些
        toView.layer.magnificationFilter = kCAFilterNearest
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


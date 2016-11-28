//
//  ViewController.swift
//  ContainerViewTest
//
//  Created by shima jinsei on 2016/11/25.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

enum ScrollState {
    case Bottom
    case Medium
    case Top
}

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    
    
    var state: ScrollState = ScrollState.Top
    
    var currentPoint: CGPoint!
    var prePoint: CGPoint!
    
    var animator: UIDynamicAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.lightGray
        
        let edgeInsets = UIEdgeInsets(top: containerView.frame.height - 120, left: 0, bottom: 0, right: 0)
        scrollView.contentInset = edgeInsets
        
        scrollView.delegate = self
        
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panGesture(sender:)))
//        containerView.addGestureRecognizer(panGesture)
        
        
//        containerView.frame = CGRect(x:containerView.frame.minX, y: containerView.frame.minY, width: containerView.frame.width, height: self.view.frame.height*0.8)
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func panGesture(sender: UIPanGestureRecognizer) {
        if sender.state == .began {
            prePoint = sender.location(in: self.view)
        }
        if sender.state == .changed {
            currentPoint = sender.location(in: self.view)
            let distance = currentPoint.y - prePoint.y
            containerView.frame = CGRect(x:containerView.frame.minX, y: containerView.frame.minY+distance, width: containerView.frame.width, height: self.view.frame.height*0.8)
            
//            if containerView.center.y-containerView.frame.height/2 < self.view.frame.height*0.02 {
//                containerView.center.y -= currentPoint.y - prePoint.y
//            }
            
            prePoint = currentPoint

        }
        if sender.state == .ended {
            let viewcontroller = self.childViewControllers[0]
            print(viewcontroller.view.frame)

//            if currentPoint.y < self.view.frame.height*0.4 {
//                print("0.4")
//                snapAnimation(point: CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.2))
//            }
//            else if currentPoint.y < self.view.frame.height*0.7 {
//                print("0.6")
//                snapAnimation(point: CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.7))
//            }
//            else if currentPoint.y < self.view.frame.height {
//                print("0.8")
//                snapAnimation(point: CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*1.0))
//            }

        }
    }
    
    // snapアニメーション
    func snapAnimation(point: CGPoint) {
        animator.removeAllBehaviors()
        let snap = UISnapBehavior(item: containerView, snapTo: point)
        animator.addBehavior(snap)
    }
}


extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}


// touch event
//extension ViewController {
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
////        let touchEvent = touches.first
//        print("touch began")
//    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        print("touch ended")
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesMoved(touches, with: event)
//        print("touch moved")
////        let touchEvent = touches.first
////        if (touchEvent?.view?.isEqual(containerView))! {
////            print("container view moved")
////        }
//    }
//}


//
//  SwipeViewController.swift
//  Impromptu
//
//  Created by Scott Tong on 3/11/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController, MDCSwipeToChooseDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

		
		let options = MDCSwipeOptions()
		options.delegate = self
		options.onPan = { state in
			switch(state.direction) {
			case .Left:
				println("We're going left")
			case .Right:
				println("We're going right")
			case .None:
				println("We went none")
			}
		}
		let swipeView = UIView(frame: CGRectMake(100, 100, 200, 200))
		swipeView.backgroundColor = UIColor.greenColor()
		swipeView.mdc_swipeToChooseSetup(options)
		view.addSubview(swipeView)
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPressBackButton(sender: AnyObject) {
		navigationController!.popViewControllerAnimated(true)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

	// Mark - MDCSwipeToChooseDelegate Methods
	
	func viewDidCancelSwipe(view: UIView!) {
		println("canceled")
	}
	
	func view(view: UIView!, shouldBeChosenWithDirection direction: MDCSwipeDirection) -> Bool {
		println("shouldbeChosen")
		return true
	}
	func view(view: UIView!, wasChosenWithDirection direction: MDCSwipeDirection) {
		println("was chosen")
	}
	
}

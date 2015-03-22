//
//  ScaleTransition.swift
//  intro-tiles
//
//  Created by Scott Tong on 3/17/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class ScaleTransition: BaseTransition {
	
	override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		
		toViewController.view.alpha = 0
		UIView.animateWithDuration(duration, animations: {
			toViewController.view.alpha = 1
			}) { (finished: Bool) -> Void in
				self.finish()
		}
	}
	
	override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		
		fromViewController.view.alpha = 1
		UIView.animateWithDuration(duration, animations: {
			fromViewController.view.alpha = 0
			}) { (finished: Bool) -> Void in
				self.finish()
		}
	}

	
}

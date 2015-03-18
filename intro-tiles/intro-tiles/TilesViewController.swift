//
//  TilesViewController.swift
//  intro-tiles
//
//  Created by Scott Tong on 3/16/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class TilesViewController: UIViewController {

	@IBOutlet weak var tile1: UIView!
	@IBOutlet weak var tile2: UIView!
	@IBOutlet weak var tile3: UIView!
	@IBOutlet weak var tile4: UIView!
	@IBOutlet weak var tile5: UIView!
	@IBOutlet weak var tile6: UIView!
	
	var duration: NSTimeInterval! = 0.7
	var damping: CGFloat! = 0.6
	var velocity: CGFloat! = 0.4
	
	var fadeTransition: FadeTransition!
	var selectedTile: UIView!

	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		tile1.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile2.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile3.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile4.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile5.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile6.transform = CGAffineTransformMakeScale(0.001, 0.001)
		

		
		tileIn()
	
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func tileIn() {
		
		
		
		// Tile 1
		UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
			self.tile1.transform = CGAffineTransformMakeScale(1, 1)
			}) { (Bool) -> Void in
				//
		}
		
		// Tile 2
		UIView.animateWithDuration(duration, delay: 0.5, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
			self.tile2.transform = CGAffineTransformMakeScale(1, 1)
			}) { (Bool) -> Void in
				//
		}
		
		// Tile 3
		UIView.animateWithDuration(duration, delay: 0.1, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
			self.tile3.transform = CGAffineTransformMakeScale(1, 1)
			}) { (Bool) -> Void in
				//
		}
		
		// Tile 4
		UIView.animateWithDuration(duration, delay: 0.4, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
			self.tile4.transform = CGAffineTransformMakeScale(1, 1)
			}) { (Bool) -> Void in
				//
		}
		
		// Tile 5
		UIView.animateWithDuration(duration, delay: 0.2, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
			self.tile5.transform = CGAffineTransformMakeScale(1, 1)
			}) { (Bool) -> Void in
				//
		}
		
		// Tile 6
		UIView.animateWithDuration(duration, delay: 0.3, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
			self.tile6.transform = CGAffineTransformMakeScale(1, 1)
			}) { (Bool) -> Void in
				//
		}

		
	}
	
	@IBAction func didPressReset(sender: AnyObject) {
		tile1.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile2.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile3.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile4.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile5.transform = CGAffineTransformMakeScale(0.001, 0.001)
		tile6.transform = CGAffineTransformMakeScale(0.001, 0.001)
		
		tileIn()
	}

	@IBAction func didTapTile(sender: UITapGestureRecognizer) {
		selectedTile = sender.view as UIView!
		UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
			self.selectedTile.transform = CGAffineTransformMakeScale(0.8, 0.8)
		}) { (Bool) -> Void in
			UIView.animateWithDuration(0.1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
				self.selectedTile.transform = CGAffineTransformMakeScale(1, 1)
			}, completion: { (Bool) -> Void in
				self.performSegueWithIdentifier("moodSegue", sender: self)
			})
			
		}
//		performSegueWithIdentifier("moodSegue", sender: self)
	}
	
	override func viewWillAppear(animated: Bool) {
		self.didPressReset(self)
	}
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		var destinationViewController = segue.destinationViewController as SelectedMoodViewController
		
		fadeTransition = FadeTransition()
		fadeTransition.duration = 0.5
		destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
		destinationViewController.transitioningDelegate = fadeTransition
		
		destinationViewController.bgcolor = selectedTile.backgroundColor

		
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
	

}

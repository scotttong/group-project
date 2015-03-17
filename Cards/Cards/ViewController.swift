//
//  ViewController.swift
//  Cards
//
//  Created by Scott Tong on 3/16/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var topCardStartingPosition: CGPoint!

	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		topCardStartingPosition = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)
		// Create the first view.
		var card1 = createCardView("Label 1")
		card1.backgroundColor = UIColor.blueColor()
		self.view.addSubview(card1)
		card1.center = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)

		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
		
		


	}
	
	func createCardView(titleText :String) -> UIView {
		let card = UIView(frame: CGRectMake(10, 10, 318, 460))
		card.backgroundColor = UIColor.greenColor()
		let label = UILabel(frame: CGRectMake(10, 10, 180, 180))
		label.text = titleText
		label.textAlignment = NSTextAlignment.Center
		card.addSubview(label)
		let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPan:")
		card.addGestureRecognizer(panGestureRecognizer)
		return card
	}
	
	@IBAction func didPan(sender: AnyObject) {
		let gestureRecognizer = sender as UIPanGestureRecognizer
		let card = gestureRecognizer.view!
		var translation = sender.translationInView(view)

		var ynlabel = UILabel(frame: CGRect(x: 20, y: 20, width: 230, height: 180))
		ynlabel.hidden = true
		
		
		if (sender.state == UIGestureRecognizerState.Began){
		}
			
			
		else if (sender.state == UIGestureRecognizerState.Changed) {
			// move the view
			card.center = CGPointMake(topCardStartingPosition.x + translation.x, topCardStartingPosition.y + translation.y)
			
			// rotate the view
			card.transform = CGAffineTransformMakeRotation(translation.x/10 * CGFloat(M_PI/180))
			
			
			
			// swipe right
			if card.center.x > view.bounds.width/2 + 100 {
				card.addSubview(ynlabel)
				ynlabel.text = "YES"
				ynlabel.textAlignment = NSTextAlignment.Center
				ynlabel.hidden = false
			}
				//swipe left
			else if  card.center.x < view.bounds.width/2 - 100 {
				card.addSubview(ynlabel)
				ynlabel.text = "NO"
				ynlabel.hidden = false
			}
				
				// didn't swipe far enough
			else if card.center.x < view.bounds.width/2 + 99 && card.center.x > view.bounds.width/2 - 99 {
				ynlabel.hidden = true
			}
			
			
//			println("is panning")
		}
			
		else if (sender.state == UIGestureRecognizerState.Ended) {
			// swipe right
			if card.center.x > view.bounds.width/2 + 100 {
				UIView.animateWithDuration(0.4, animations: { () -> Void in
					card.center.x = self.view.bounds.width * 2
//					ynlabel.text = "YES"
//					ynlabel.hidden = false
				}, completion: { (Bool) -> Void in
					
					// removed current card
					card.removeFromSuperview()
					
					// create a new card
					var card = self.createCardView("Label 1")
					card.backgroundColor = UIColor.greenColor()
					card.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
					card.alpha = 0
					self.view.addSubview(card)
					
					// animate a new card in
					UIView.animateWithDuration(0.4, animations: { () -> Void in
						card.alpha = 1
					})
				})
				
				
			
			
				
				//swipe left
			} else if  card.center.x < view.bounds.width/2 - 100 {
				UIView.animateWithDuration(0.4, animations: { () -> Void in
					card.center.x = -self.view.bounds.width * 2
//					ynlabel.text = "NO"
//					ynlabel.hidden = false
					}, completion: { (Bool) -> Void in
						
						// removed current card
						card.removeFromSuperview()
						
						// create a new card
						var card = self.createCardView("Label 1")
						card.backgroundColor = UIColor.greenColor()
						card.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
						card.alpha = 0
						self.view.addSubview(card)
						
						// animate a new card in
						UIView.animateWithDuration(0.4, animations: { () -> Void in
							card.alpha = 1
						})
				})
			}
				
				// didn't swipe far enough
			else {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					card.center = CGPointMake(self.view.bounds.width/2, self.view.bounds.height/2)
					card.transform = CGAffineTransformMakeRotation(0)
					ynlabel.hidden = true
					
				})
			}
			
		}
	}



}


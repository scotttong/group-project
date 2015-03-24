//
//  TilesViewController.swift
//  receiver-ui
//
//  Created by Scott Tong on 3/18/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class TilesViewController: UIViewController {

	@IBOutlet weak var favoriteBadge: UIView!
	var fadeTransition: FadeTransition!
	var accepted: Bool = false
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		favoriteBadge.layer.cornerRadius = 15
		favoriteBadge.transform = CGAffineTransformMakeScale(0.001, 0.001)
		favoriteBadge.hidden = true
		
		

    }
	
	override func viewDidAppear(animated: Bool) {
		println("viewDidAppear")
		println(accepted)
		if accepted == true  {
			
			favoriteBadge.hidden = false
			
			UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
				self.favoriteBadge.transform = CGAffineTransformMakeScale(1, 1)

			}, completion: { (Bool) -> Void in
				//
			})

//			var number = UIView(frame: CGRect(x: view.frame.width - 80, y: 40, width: 40, height: 40))
//			number.backgroundColor = UIColor.orangeColor()
//			number.layer.cornerRadius = 20
//			view.addSubview(number)
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didTapInviteButton(sender: AnyObject) {
		performSegueWithIdentifier("inviteSegue", sender: self)
	}

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		var destinationViewController = segue.destinationViewController as InvitationViewController
		
		fadeTransition = FadeTransition()
		fadeTransition.duration = 0.5
		destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
		destinationViewController.transitioningDelegate = fadeTransition

		
		// Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
	
	

}

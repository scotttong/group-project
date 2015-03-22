//
//  TilesViewController.swift
//  receiver-ui
//
//  Created by Scott Tong on 3/18/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class TilesViewController: UIViewController {

	var fadeTransition: FadeTransition!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

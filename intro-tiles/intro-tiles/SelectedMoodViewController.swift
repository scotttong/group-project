//
//  SelectedMoodViewController.swift
//  intro-tiles
//
//  Created by Scott Tong on 3/17/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class SelectedMoodViewController: UIViewController {
	@IBOutlet weak var moodBackgroundColor: UIView!

	var tilesViewController: TilesViewController!
	var bgcolor: UIColor!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		moodBackgroundColor.backgroundColor = bgcolor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

		
		var storyboard = UIStoryboard(name: "Main", bundle: nil)
		tilesViewController = storyboard.instantiateViewControllerWithIdentifier("tilesStory") as TilesViewController

    }
	
	override func viewDidAppear(animated: Bool) {

	}
    
	@IBAction func didPressDismissButton(sender: AnyObject) {
		// for modal transition
		//dismissViewControllerAnimated(true, completion: nil)

		
		// for push transition
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

}

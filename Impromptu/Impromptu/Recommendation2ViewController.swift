//
//  Recommendation2ViewController.swift
//  Impromptu
//
//  Created by Scott Tong on 3/11/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class Recommendation2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPressBackButton(sender: AnyObject) {
		navigationController!.popToRootViewControllerAnimated(true)
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

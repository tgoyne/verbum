//
//  DictionaryViewController.swift
//  Verbum
//
//  Created by Peter on 21/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {
	
	let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
	@IBOutlet weak var revealButton: UIBarButtonItem!
	
    override func viewDidLoad() {
		
        super.viewDidLoad()
		self.navigationController.navigationBar.barTintColor = UIColor.colorWithRGBHex(appDelegate.navBarTint, alpha: 1)
		self.navigationController.navigationBar.tintColor = UIColor.colorWithRGBHex(0xffffff, alpha: 1)
		//UITabBar().tintColor = UIColor.colorWithRGBHex(appDelegate.navBarTint, alpha: 1)
		
		revealViewController().rearViewRevealWidth = 150 // Width of Drawer
		revealViewController().frontViewShadowOpacity = 0.5
		revealButton.target = revealViewController()
		revealButton.action = Selector("revealToggle:")
		
		var rec:UIGestureRecognizer = revealViewController().panGestureRecognizer() as UIGestureRecognizer
		self.navigationController.navigationBar.addGestureRecognizer(rec)
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
	}

}

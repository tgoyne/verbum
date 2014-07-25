//
//  FirstViewController.swift
//  Verbum
//
//  Created by Peter on 20/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController.navigationBar.barTintColor = UIColor.colorWithRGBHex(appDelegate.navBarTint, alpha: 1)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}


}


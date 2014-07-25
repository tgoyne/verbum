//
//  DrawerViewController.swift
//  Verbum
//
//  Created by Peter on 25/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	
	var items:[String] = ["Russian", "Spanish"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}
	
	func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return self.items.count;
	}
	
	func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
		cell.textLabel.text = self.items[indexPath.row]
		return cell
	}
	
	func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
		self.revealViewController().revealToggleAnimated(true)
		println("You selected cell #\(indexPath.row)!")
		
//		var alert = UIAlertView()
//		alert.title =  "Message"
//		alert.message = "This is to inform you that an action has been executed"
//		alert.addButtonWithTitle("Alright")
//		alert.show()
	}
}


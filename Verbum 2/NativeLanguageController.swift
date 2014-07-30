//
//  NativeLanguageController.swift
//  Verbum 2
//
//  Created by Peter on 29/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import Realm
import UIKit

class NativeLanguageController: UITableViewController, UITableViewDataSource {

	var array = RLMArray()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		var dismissButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "dismiss")
		self.navigationItem.leftBarButtonItem = dismissButton
		setupUI()
		array = Language.allObjects()
		tableView.reloadData()
	}
	
	override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
		return Int(array.count)
	}
	
	func setupUI() {
		tableView.registerClass(Cell.self, forCellReuseIdentifier: "cell")
		//self.title = "Languages"
	}
	
	func dismiss() {
		self.view.endEditing(true)
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
		let cell = tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as Cell
		let object = array[UInt(indexPath!.row)] as Language
		cell.textLabel.text = object.title
		return cell
	}
	
	func textFieldShouldReturn(textField: UITextField!) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}

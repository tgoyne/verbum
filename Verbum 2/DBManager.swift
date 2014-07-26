//
//  DBManager.swift
//  Verbum 2
//
//  Created by Peter on 26/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import Realm

class Language: RLMObject {
	var title = ""
	var position:Int?
}

class DBManager {
	
	func deleteRealmFile() -> Void {
		let documentsPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
		var path = documentsPaths.stringByAppendingPathComponent("default.realm")
		NSFileManager.defaultManager().removeItemAtPath(path, error: nil)
	}
	
//	func add(realm:RLMRealm, table:RLMObject, data:NSArray) -> Bool {
//		
//		realm.beginWriteTransaction()
//		table.createInRealm(realm, withObject: data)
//		realm.commitWriteTransaction()
//		
//		return true
//	}
	
}

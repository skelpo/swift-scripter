//
//  main.swift
//  Importer
//
//  Created by Ralph Küpper on 12/4/17.
//  Copyright © 2017 Skelpo Inc. All rights reserved.
//

import Foundation
import MySQL
import JSON
import Core
import SwiftyJSON
import Configuration

let manager = ConfigurationManager()
manager.load(file: "config.json", relativeFrom: .pwd)

print("Setting up database..")

let mysql = try MySQL.Database(
    hostname: manager["mysql:host"] as! String,
    user: manager["mysql:user"] as! String,
    password: manager["mysql:password"] as! String,
    database: manager["mysql:database"] as! String)

var connection = try mysql.makeConnection()

print("Reading Data file..")

// in this case we use json, but it could really be anything (XML, CVS, ..)
let file = "data.json"
var text = ""

do {
    text = try String(contentsOf: URL(fileURLWithPath: file), encoding: .utf8)
}
catch {
    print("cannot read the file..")
    exit(0)
}

// this is all up to you but the concept should be clear
if let dataFromString = text.data(using: .utf8, allowLossyConversion: false) {
    let json = try JSON(data: dataFromString)
    
    for (_,row):(String, SwiftyJSON.JSON)  in json {
        let id:Int = row["id"].int!
        let name = row["name"].string!
        
        // you could select rows
        let someResult = try connection.execute("SELECT * FROM someTable WHERE id = \(id)")
        for someResult in libraríesDb.wrapped.array! {
            // and update others
            try connection.execute("UPDATE someOtherTable SET something = '\(name)' WHERE id = \(id)")
        }
    }
}

print("done.")


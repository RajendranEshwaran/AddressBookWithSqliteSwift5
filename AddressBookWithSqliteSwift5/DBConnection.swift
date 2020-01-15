//
//  DBConnection.swift
//  AddressBookWithSqliteSwift5
//
//  Created by gomathi saminathan on 1/15/20.
//  Copyright © 2020 Rajendran Eshwaran. All rights reserved.
//

import Foundation
import SQLite3


class DBConnection
{
    
    static let instance = DBConnection()
    var db : OpaquePointer?
    
    init()
    {
        do{
            let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("AddressBook.sqlite")
            
            if sqlite3_open(filePath.path, &db) != SQLITE_OK
            {
                print("Error in file open")
            }
            
        }
        catch{
            print("Error in File create")
        }
    }
    
    func createTable()
    {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS contact (id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT , phoneno TEXT , address TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            print("Error in table create ")
        }
         print("Table Created Successfully")
    }
    
    func addContact(cname: String, cphone: String, caddress: String)
    {
        
            var stmt : OpaquePointer?
            let insertQuery = "INSERT INTO Heros(name ,powerrank) VALUES (?,?)"
            
            if sqlite3_prepare(self.db, insertQuery, -1, &stmt, nil) != SQLITE_OK{
                print("Error binding in query")
            }
            
            if sqlite3_bind_text(stmt, 1, cname, -1, nil) != SQLITE_OK
            {
                print("Error in binding name value")
            }
            
            if sqlite3_bind_text(stmt, 2, cphone, -1, nil) != SQLITE_OK
            {
                print("Error in binding phoneno value")
            }
            
            if sqlite3_bind_text(stmt, 3, caddress, -1, nil) != SQLITE_OK
            {
                print("Error in binding address value")
            }
            
             if  sqlite3_step(stmt) == SQLITE_DONE
             {
                print("Contact  Saved Successfully")
            }
        
    }
    
    
        func getContacts() -> [Contact] {
            var contacts = [Contact]()

            do {
                
                }
             catch {
                print("Select failed")
            }

            return contacts
        }
    
}

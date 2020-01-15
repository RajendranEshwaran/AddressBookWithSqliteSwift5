//
//  Contact.swift
//  AddressBookWithSqliteSwift5
//
//  Created by gomathi saminathan on 1/15/20.
//  Copyright © 2020 Rajendran Eshwaran. All rights reserved.
//

import Foundation
class Contact
{
    let id : Int64?
    var name : String
    var phoneno : String
    var address : String
    
    init(id : Int64 , name : String , phoneno : String , address : String)
    {
        self.id = id
        self.name = name
        self.phoneno = phoneno
        self.address = address
    }
    
}

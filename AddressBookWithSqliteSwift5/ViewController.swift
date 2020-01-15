//
//  ViewController.swift
//  AddressBookWithSqliteSwift5
//
//  Created by gomathi saminathan on 1/15/20.
//  Copyright © 2020 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTxt : UITextField!
    @IBOutlet weak var phoneTxt :UITextField!
    @IBOutlet weak var addressTxt : UITextField!
    @IBOutlet weak var contactTblView : UITableView!
    
    private var contacts = [Contact]()
    private var selectedContact : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contactTblView.delegate = self
        contactTblView.dataSource = self
        
       
    }

    @IBAction func addContacts()
    {
        let name = nameTxt.text ?? ""
        let phone = phoneTxt.text ?? ""
        let address = addressTxt.text ?? ""
        
        let contact = Contact(id: 0, name: name, phoneno: phone, address: address)
        
        contacts.append(contact)
       
        contactTblView.insertRows(at: [IndexPath(row: contacts.count-1, section: 0)], with: .fade)

         DBConnection.instance.addContact(cname: name, cphone: phone, caddress: address)
    }
    
    @IBAction func updateContact()
    {
         if selectedContact != nil {
            let id = contacts[selectedContact!].id!
            let contact = Contact(
                id: id,
                name: nameTxt.text ?? "",
                phoneno: phoneTxt.text ?? "",
                address: addressTxt.text ?? "")
            contacts.remove(at: selectedContact ?? 0)
            contacts.insert(contact, at: selectedContact!)
            contactTblView.reloadData()
        }
        else
         {
            print("NO item selected")
        }
    }
    
    
    @IBAction func deleteContact()
    {
        if selectedContact != nil {
            contacts.remove(at: selectedContact!)
            
            contactTblView.deleteRows(at: [IndexPath(row: selectedContact!, section: 0)], with: .fade)

        } else {
        print("No item selected")
        }
    }

}

extension ViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        var label : UILabel
        label = cell.viewWithTag(1) as! UILabel
        label.text = contacts[indexPath.row].name
        
        label = cell.viewWithTag(2) as! UILabel
        label.text = contacts[indexPath.row].phoneno
        
        label = cell.viewWithTag(3) as! UILabel
        label.text = contacts[indexPath.row].address
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = indexPath.row
    }
    
}

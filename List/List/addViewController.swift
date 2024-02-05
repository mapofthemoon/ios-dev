//
//  addViewController.swift
//  List
//
//  Created by temirkhan on 15.12.2023.
//

import Foundation
import UIKit

class AddPersonViewController: UITableViewCell {
    @IBOutlet weak var firstNameTextField: UITableViewCell!

    weak var delegate: addDelegate?

    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let firstName = firstNameTextField.text !firstName.isEmpty
                
    } else {
            return
        }

        let newPerson = Person(firstName: firstName, lastName: lastName)
        delegate?.didAddPerson(newPerson)
        navigationController?.popViewController(animated: true)
    }
}

extension ViewController: addDelegate {
    func didAddPerson(_ person: Person) {
        people.append(person)
        reloadData()
    }
}


    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortByNameButton: UIButton!
    @IBOutlet weak var sortByLastNameButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    var people: [Person] = [
        Person(firstName: "Margaery", lastName: "Tyrell"),
        Person(firstName: "Sansa", lastName: "Stark"),
        Person(firstName: "John", lastName: "Snow"),
        Person(firstName: "Tyrion", lastName: "Lannister"),
    ]
    
    var isSortingByName = false
    var isSortingByLastName = false
    var isDefaultState = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PersonCell")

        tableView.dataSource = self
        tableView.delegate = self
        
        sortByNameButton.addTarget(self, action: #selector(sortByName), for: .touchUpInside)
        sortByLastNameButton.addTarget(self, action: #selector(sortByLastName), for: .touchUpInside)
        
        reloadData()
        
    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
           navigationItem.rightBarButtonItem = addButton
    }
    
    
    
    func reloadData() {
            if isSortingByName {
                people.sort { $0.firstName < $1.firstName }
            } else if isSortingByLastName {
                people.sort { $0.lastName < $1.lastName }
            }else{
                people.sort { $0.firstName < $1.firstName }
            }
            tableView.reloadData()
        }
    
    @objc func sortByName() {
        if isSortingByName {
                // If already sorting by name, toggle to default state
                isSortingByName = false
                isDefaultState = true
            } else {
                // If not sorting by name, sort by name
                isSortingByName = true
                isSortingByLastName = false
                isDefaultState = false
                people.sort { $0.firstName < $1.firstName }
            }

            reloadData()
        }
    
    @objc func sortByLastName() {
        if isSortingByLastName {
               // If already sorting by last name, toggle to default state
               isSortingByLastName = false
               isDefaultState = true
           } else {
               // If not sorting by last name, sort by last name
               isSortingByLastName = true
               isSortingByName = false
               isDefaultState = false
               people.sort { $0.lastName < $1.lastName }
           }

           reloadData()
    }
    
    @objc func addButtonTapped() {
        let addPersonViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addViewController") as! AddPersonViewController
        addPersonViewController.delegate = self
        navigationController?.pushViewController(addPersonViewController, animated: true)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = people[indexPath.row]
        cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
        return cell
        
    }
    



    
    
    
}


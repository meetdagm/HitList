//
//  ViewController.swift
//  HitList
//
//  Created by Dagmawi Nadew-Assefa on 5/26/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let mainView = MainView()
    var people = [Person]()
    let cellID = "cellID"
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadItems()
    }
    
    override func loadView() {
        self.view = mainView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        self.navigationItem.title = "Testing"
    }
    
    func setupTableView() {
        mainView.viewTableView.delegate = self
        mainView.viewTableView.dataSource = self
        mainView.viewTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    @objc func addItem() {
        let alertController = UIAlertController(title: "Add a Friend", message: "What is your Friend's name", preferredStyle: .alert)
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            guard let newName = alertController.textFields?.first?.text else {return}
            let person = Person(context: self.context)
            person.name = newName
            self.save(person)
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(saveButton)
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: Extension for Tableview delegate and datasource properties

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainView.viewTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }
    
}

//MARK: CORE Data Properties

extension ViewController {
    
    func save(_ person: Person){
        do{
            try context.save()
            people.append(person)
            self.mainView.viewTableView.reloadData()
        }catch{
            print("Error Saving Elements")
        }
    }
    
    func loadItems() {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do{
            people = try context.fetch(request)
            self.mainView.viewTableView.reloadData()
        }catch{
            print("Error Fetching People")
        }
    }
}



























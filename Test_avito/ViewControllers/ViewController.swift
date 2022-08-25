//
//  ViewController.swift
//  Test_avito
//
//  Created by Евгения Шевцова on 25.08.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    private let tableView = UITableView()
    private var employees: [Employee] = []
    private var company: Company? 
    private var networkService: NetworkManagerImplementation = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        view.backgroundColor = .green
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
//        networkService.fetchData(from: Link.url) { result in
//            self.employees = getEmployees
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
        }
    

    
    private func setupNavigationBar() {
        navigationItem.title = "Avito"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if #available(iOS 13, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    
    }
    
    
    
//    private func fetchEmployees(from url: String?) {
//        networkService.fetchData(from: url) { result in
//            switch result {
//            case .success( )
//            }
//        }
//    }
    
    
    }

    



extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return employees.count
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        cell.textLabel?.text = employees[indexPath.row].name
//        cell.textLabel?.text = employees[indexPath.row].phoneNumber
//        cell.textLabel?.text = employees[indexPath.row].skills
        cell.textLabel?.text = "hi, avito"
        return cell
    }
    
    
}

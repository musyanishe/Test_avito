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
    private var responseCompany: ResponseCompany? {
        didSet {
            self.tableView.reloadData()
        }
    }
    private var titleFromModel: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureTableView()
        fetchCompany()
        
    }
    
    private func configureTableView() {
        view.backgroundColor = .green
        view.addSubview(tableView)
        tableView.pin(to: view) 
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        title = titleFromModel?.name ?? "Avito"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if #available(iOS 13, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = UIColor.theme.blue
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseCompany?.company.employees.count ?? 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let employee = responseCompany?.company.employees[indexPath.row]
        cell.nameLabel.text = employee?.name
        cell.phoneLabel.text = employee?.phoneNumber
        cell.skillsLabel.text = employee?.skills.joined(separator: " ")
        return cell
    }
    
}

extension ViewController {
    
    func fetchCompany() {
        NetworkManager.shared.fetch(dataType: ResponseCompany.self, from: Link.url) { result in
            switch result {
            case .success(let company):
                self.responseCompany = company
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

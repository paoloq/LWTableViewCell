//
//  ViewController.swift
//  LWTableViewCell
//
//  Created by Paolo Arduin on 08/06/2017.
//  Copyright (c) 2017 Paolo Arduin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero,
                                         style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExampleCell.self,
                           forCellReuseIdentifier: ExampleCell.identifier)
        return tableView
    }()
    
    fileprivate var elements: [ExampleElement] = []
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        self.tableView.frame = self.view.bounds
        self.tableView.frame.origin.y += statusBarHeight
        self.tableView.frame.size.height -= statusBarHeight
        self.view.addSubview(self.tableView)
        
        self.popolate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    
    fileprivate func popolate() {
        if let url = Bundle.main.url(forResource: "icon-names", withExtension: nil) {
            let dataString = try! String.init(contentsOf: url, encoding: .utf8)
            let imageNames = dataString.components(separatedBy: "\n")
            
            imageNames.forEach {
                if let image = UIImage.init(named: $0) {
                    let title = $0.replacingOccurrences(of: "icon-", with: "")
                    let element = ExampleElement.init(image: image, title: title)
                    self.elements.append(element)
                }
            }
            
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elements.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ExampleCell.identifier,
                                             for: indexPath)
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ExampleCell.estimatedHeight()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let exampleCell = cell as? ExampleCell {
            exampleCell.element = self.elements[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


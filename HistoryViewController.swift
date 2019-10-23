//
//  HistoryViewController.swift
//  Calculator
//
//  Created by Tiffany on 2019/10/23.
//  Copyright © 2019 Tiffany van der Merwe. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var historyItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        historyItems = UserDefaults.standard.array(forKey: "equations") as? [String] ?? [""]
        tableView.reloadData()
    }
    
    @IBAction func onClearTap(_ sender: Any) {
        historyItems.removeAll()
        if let viewController = self.presentingViewController as? ViewController {
            viewController.equations.removeAll()
            self.dismiss(animated: true, completion: {
                UserDefaults.standard.set([""], forKey: "equations")
            })
        }
    }
    
    
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = historyItems[indexPath.row]
        
        return cell
    }
    
    
}



//
//  DateTimeTableViewController.swift
//  HW2.10NetworkingUrlSession
//
//  Created by Anton Duplin on 4/7/22.
//

import UIKit

class DateTimeTableViewController: UITableViewController {
    private var dateTime: [Date] = []
    override func viewDidLoad() {
        super.viewDidLoad()
sendRequest()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dateTime.count    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DateTableViewCell
        
        let dateList = dateTime[indexPath.row]
        cell.configure(with: dateList)
        return cell
    }
    private func sendRequest() {
        NetworkManager.shared.fetchData { currencyRates in
            DispatchQueue.main.async {
                self.dateTime = currencyRates
                self.tableView.reloadData()
                
            }
        }
    }
   
}

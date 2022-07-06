//
//  ViewController.swift
//  HW2.10NetworkingUrlSession
//
//  Created by Anton Duplin on 6/7/22.
//

import UIKit

class ViewController: UIViewController {
    var infoDate: Date?
    @IBOutlet weak var clientIpLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     fetchIpGeo()
        
    }
    
    func fetchIpGeo() {

        guard  let url = URL(string: URLS.dateTime.rawValue) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print (error?.localizedDescription ?? "no error description")
                return
            }

            do {
                self.infoDate = try JSONDecoder().decode(Date.self, from: data)

                DispatchQueue.main.async {
                    self.clientIpLabel.text = "Your IP Address: \(self.infoDate?.client_ip ?? "No ip detected")"
                    self.dateTimeLabel.text = "Date Time: \(self.infoDate?.datetime ?? "No date detected")"
                    self.timeZoneLabel.text = "Time Zone; \(self.infoDate?.timezone ?? "0")"
                    self.dayOfWeekLabel.text = "Day Of Week: \(self.infoDate?.day_of_week ?? 0)"
                }
            } catch let error {
                print(error.localizedDescription)
            }

        }.resume()
    }
    
    



}

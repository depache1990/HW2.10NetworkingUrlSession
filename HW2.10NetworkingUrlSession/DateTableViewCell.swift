//
//  DateTableViewCell.swift
//  HW2.10NetworkingUrlSession
//
//  Created by Anton Duplin on 5/7/22.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    @IBOutlet weak var clientIpLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    
    func configure (with date: Date) {
        clientIpLabel.text = "Your IP Address: \(date.client_ip ?? "No ip detected")"
        dateTimeLabel.text = "Date Time: \(date.datetime ?? "No date detected")"
        timeZoneLabel.text = "Time Zone; \(date.timezone ?? "0")"
        dayOfWeekLabel.text = "Day Of Week: \(date.day_of_week ?? 0)"
        
    }
    

}

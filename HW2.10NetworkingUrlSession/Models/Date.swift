//
//  Date.swift
//  HW2.10NetworkingUrlSession
//
//  Created by Anton Duplin on 4/7/22.
//


struct Date: Decodable {
    let client_ip: String?
    let datetime: String?
    let timezone: String?
    let day_of_week: Int?
}


enum URLS: String {
case dateTime = "http://worldtimeapi.org/api/ip"
}

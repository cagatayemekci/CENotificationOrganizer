//
//  File.swift
//  
//
//  Created by Çağatay Emekci on 21.03.2020.
//

import Foundation

struct NotificationModel {
    let title:String
    let body: String
    let sound: UNNotificationSound
    let badge: Int?
    let categoryIdentifier: String?
    let userInfo: [AnyHashable : Any]?
}

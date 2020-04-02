//
//  File.swift
//  
//
//  Created by Çağatay Emekci on 2.04.2020.
//

import UserNotifications
@testable import CENotificationOrganizer

class MockNotificationCenter: NotificationCenterProtocol {
        
    typealias Authorization = ((((Bool, Error?) -> Void)) -> Void)?
    typealias Add = ((((Error?) -> Void)?) -> Void)?

    var requestAuthorization: Authorization
    var add: Add
    var permission: ((UNNotificationSettings) -> Void)?
    var requestAuthorizationIsCalled: Bool = false
    init(requestAuthorization: Authorization = nil, add: Add = nil ) {
        self.requestAuthorization = requestAuthorization
        self.add = add
    }
    
    func setNotificationCategories(_ categories: Set<UNNotificationCategory>) {
        
    }
    
    func requestAuthorization(options: UNAuthorizationOptions, completionHandler: @escaping (Bool, Error?) -> Void) {
        requestAuthorizationIsCalled = true
        requestAuthorization?(completionHandler)
    }
    
    func add(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)?) {
        add?(completionHandler)
    }
    
    func getNotificationSettings(completionHandler: @escaping (UNNotificationSettings) -> Void) {
        
    }
    
}


//
//  File.swift
//  
//
//  Created by Çağatay Emekci on 21.03.2020.
//

import XCTest
@testable import CENotificationOrganizer

final class NotificationManagerTests: XCTestCase {
    
    var manager: NotificationManagerProtocol?
    
    static var allTests = [
        (testGetUserPermission),
    ]
    
    func testGetUserPermission() {
        let mock = MockNotificationCenter(requestAuthorization: { (state) in
            state(true, nil)
        })
        manager = NotificationManager(notificationCenter: mock)
        manager?.getUserPermission()
        XCTAssertTrue(mock.requestAuthorizationIsCalled)
    }
}

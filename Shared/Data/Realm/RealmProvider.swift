//
//  RealmProvider.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import UIKit
import RealmSwift

// MARK: - RealmProvider
public struct RealmProvider {
    // MARK: - Stored Properties
    let configuration: Realm.Configuration

    // MARK: - Init
    init(config: Realm.Configuration) {
        configuration = config
    }

    private var realm: Realm? {
        do {
            return try Realm(configuration: configuration)
        } catch {
            return nil
        }
    }

    // MARK: - Configuration
    private static let defaultConfig = Realm.Configuration(schemaVersion: 1)
    // Can add other configuration here , read from file ,etc ...

    // MARK: - Realm Instances
    public static var `default`: Realm? = {
        return RealmProvider(config: RealmProvider.defaultConfig).realm
    }()
}

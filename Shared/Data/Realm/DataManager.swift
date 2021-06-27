//
//  DataManager.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import Combine
import Foundation
import RealmSwift

protocol DataManager {
    func create(object: Storable) throws
    func save(object: Storable) throws
    func batchSave(object: [Storable]) throws
    func update(object: Storable) throws
    func delete(object: Storable) throws
    func deleteAll<T: Storable>(_ model: T.Type) throws
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?) -> Future<[T], RealmError>
    func fetchUniqForPrimeryKey<T: Storable>(_ model: T.Type, key: String) -> Future<T, RealmError>
}

class RealmDataManager {
    private let realm: Realm?

    init(_ realm: Realm?) {
        self.realm = realm
    }
}

extension RealmDataManager: DataManager {
    func create(object: Storable) throws {
        guard let realm = realm, let object = object as? Object else {
            throw RealmError.realmIsNilOrNotSpecificModel
        }
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            throw RealmError.saveObjectFail
        }
    }

    func save(object: Storable) throws {
        guard let realm = realm, let object = object as? Object else { throw RealmError.realmIsNilOrNotSpecificModel }
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            throw RealmError.saveObjectFail
        }
    }

    func batchSave(object: [Storable]) throws {
        guard let realm = realm, let object = object as? [Object] else { throw RealmError.realmIsNilOrNotSpecificModel }
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            throw RealmError.saveObjectFail
        }
    }

    func update(object: Storable) throws {
        guard let realm = realm, let object = object as? Object else { throw RealmError.realmIsNilOrNotSpecificModel }
        try realm.write {
            realm.add(object, update: .all)
        }
    }

    func delete(object: Storable) throws {
        guard let realm = realm, let object = object as? Object else { throw RealmError.realmIsNilOrNotSpecificModel }
        try realm.write {
            realm.delete(object)
        }
    }

    func deleteAll<T>(_ model: T.Type) throws where T: Storable {
        guard let realm = realm, let model = model as? Object.Type else { throw RealmError.realmIsNilOrNotSpecificModel }
        try realm.write {
            let objects = realm.objects(model)
            realm.delete(objects)
        }
    }

    func fetch<T>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?) -> Future<[T], RealmError> where T: Storable {
        return Future<[T], RealmError> { [weak self] promis in
            guard let realm = self?.realm, let model = model as? Object.Type else {
                return promis(.failure(.realmIsNilOrNotSpecificModel))
            }
            var objects = realm.objects(model)
            if let predicate = predicate {
                objects = objects.filter(predicate)
            }
            if let sorted = sorted {
                objects = objects.sorted(byKeyPath: sorted.key, ascending: sorted.ascending)
            }
            return promis(.success(objects.compactMap { $0 as? T }))
        }
    }

    func fetchUniqForPrimeryKey<T>(_ model: T.Type, key: String) -> Future<T, RealmError> where T: Storable {
        return Future<T, RealmError> { [weak self] promis in
            guard let realm = self?.realm, let model = model as? Object.Type else {
                return promis(.failure(.realmIsNilOrNotSpecificModel))
            }
            guard let object = realm.object(ofType: model, forPrimaryKey: key) as? T else {
                return promis(.failure(.realmFetchIsNil))
            }
            return promis(.success(object))
        }
    }
}

//
//  AnyPromise+Utilities.swift
//  BFTask-PromiseKit
//
//  Created by Eddie Hiu-Fung Lau on 27/2/2020.
//

import Foundation

public extension AnyPromise {
    
    enum Error : Swift.Error {
        case castError(Any.Type)
    }

    func asPromise<T>(type: T.Type) -> Promise<T> {
        return map { (value: Any?) -> T in
            if let value = value as? T {
                return value
            }
            throw Error.castError(type)
        }
    }
    
}

//
//  ThrowErrorHelper.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 09.06.2024.
//

import Foundation

public func throwError<T>(_ error: Error) throws -> T {
    throw error
}

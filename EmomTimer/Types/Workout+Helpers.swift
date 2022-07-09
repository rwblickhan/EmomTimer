//
//  Workout+Helpers.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/17/22.
//

import CoreData
import Foundation

extension Workout {
    var timeInterval: TimeInterval {
        let numSeconds = ((exercises?.array as? [Exercise]) ?? [])
            .reduce(0) { res, exercise in res + exercise.numSeconds }
        return Double(numSeconds) * Double(numRounds)
    }
}

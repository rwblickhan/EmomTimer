//
//  Workout+Helpers.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/17/22.
//

import Foundation

extension Workout {
    var totalMinutes: Double {
        let numSeconds = ((exercises?.array as? [Exercise]) ?? []).reduce(0) { res, exercise in res + exercise.numSeconds }
        return Double(numSeconds) / 60 * Double(numRounds)
    }
}

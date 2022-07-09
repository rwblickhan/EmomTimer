//
//  PartialExercise.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/23/22.
//

import Foundation

struct PartialExercise: Identifiable, Hashable {
    var id = UUID()
    var name: String = ""
    var numReps: Int?
    var numSeconds: Int?
    var rank: Double = -1

    var hasEdits: Bool { !name.isEmpty || numReps != nil || numSeconds != nil }
    var isComplete: Bool { !name.isEmpty && numReps != nil && numSeconds != nil && rank != -1 }
}

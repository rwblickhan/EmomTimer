//
//  AddExerciseCardView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/20/22.
//

import SwiftUI

struct PartialExercise: Identifiable {
    var id: UUID
    var name: String = ""
    var numReps: Int?
    var numSeconds: Int?
    var rank: Double = -1
}

struct AddExerciseCardView: View {
    private enum TimeType {
        case seconds
        case minutes
    }

    @Binding var exercise: PartialExercise
    @State private var timeType: TimeType = .seconds
    
    var body: some View {
        VStack {
            TextField(String(localized: "Name Exercise"), text: $exercise.name)
                .font(.headline)
            HStack {
                TextField("3", value: $exercise.numReps, formatter: NumberFormatter())
                    .font(.subheadline)
                Text(String(localized: "Rounds"))
                    .font(.subheadline)
            }
            HStack {
                TextField("60", value: $exercise.numReps, formatter: NumberFormatter())
                    .font(.subheadline)
                Picker("", selection: $timeType) {
                    Text(String(localized: "Seconds")).tag(TimeType.seconds)
                    .font(.subheadline)
                    Text(String(localized: "Minutes")).tag(TimeType.minutes)
                    .font(.subheadline)
                }
            }
        }
        .padding()
    }
}

struct AddExerciseCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseCardView(exercise: .constant(PartialExercise(id: UUID())))
    }
}

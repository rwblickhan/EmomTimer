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
    @Binding var exercise: PartialExercise

    var body: some View {
        VStack {
            TextField(String(localized: "Name Exercise"), text: $exercise.name)
        }
        .padding()
    }
}

struct AddExerciseCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseCardView(exercise: .constant(PartialExercise(id: UUID())))
    }
}

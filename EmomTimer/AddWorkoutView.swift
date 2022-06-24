//
//  AddWorkoutView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/20/22.
//

import SwiftUI

struct AddWorkoutView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var workoutName = ""
    @State private var numRounds = 3
    @State private var exercises = [PartialExercise(id: UUID(), rank: 0)]

    private var hasEdits: Bool {
        !workoutName.isEmpty || exercises.contains(where: \.hasEdits)
    }

    private var isComplete: Bool {
        !workoutName.isEmpty && exercises.count > 1 && exercises.allSatisfy(\.isComplete)
    }

    var body: some View {
        VStack {
            TextField(String(localized: "Name Your Workout"), text: $workoutName)
                .font(.title)
            AddExercisesView(exercises: $exercises)
            Stepper(
                String.localizedStringWithFormat("Repeat for %d rounds", numRounds),
                value: $numRounds,
                in: 1 ... Int.max)
            saveButton
        }
        .padding()
        .interactiveDismissDisabled(hasEdits)
    }

    private var saveButton: some View {
        Button(action: {
            guard isComplete else { return }
            // TODO:
        }, label: {
            Text(String(localized: "Save"))
                .font(.headline)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
        })
        .disabled(!isComplete)
        .padding(12)
        .background(Color.blue)
        .cornerRadius(20)
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView()
    }
}

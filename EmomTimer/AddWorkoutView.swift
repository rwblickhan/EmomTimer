//
//  AddWorkoutView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/20/22.
//

import SwiftUI

struct AddWorkoutView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var allowSwipeToDismiss = true

    @State private var workoutName = ""
    @State private var numRounds = 3

    var body: some View {
        VStack {
            TextField(String(localized: "Name Your Workout"), text: $workoutName)
                .font(.title)
                .onChange(of: workoutName, perform: { _ in onEdit() })
            ScrollView {
                AddExerciseCardView()
            }
            Spacer()
            Stepper(
                String.localizedStringWithFormat("Repeat for %d rounds", numRounds),
                value: $numRounds,
                in: 1 ... Int.max,
                onEditingChanged: { _ in onEdit() })
            saveButton
        }
        .padding()
        .interactiveDismissDisabled(!allowSwipeToDismiss)
    }

    private var hasEdits: Bool {
        !workoutName.isEmpty
    }

    private func onEdit() {
        allowSwipeToDismiss = !hasEdits
    }

    private var saveButton: some View {
        Button(action: {
            // TODO:
        }, label: {
            Text(String(localized: "Save"))
                .font(.headline)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
        })
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

//
//  AddWorkoutView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/20/22.
//

import SwiftUI

struct AddWorkoutView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var workoutName = ""
    @State private var numRounds = 3
    @State private var exercises = [PartialExercise(id: UUID(), rank: 0)]

    private var hasEdits: Bool {
        !workoutName.isEmpty || exercises.contains(where: \.hasEdits)
    }

    private var isComplete: Bool {
        !workoutName.isEmpty && exercises.count > 0 && exercises.allSatisfy(\.isComplete)
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
            let workout = Workout(context: viewContext)
            workout.name = workoutName
            workout.numRounds = Int32(numRounds)
            #warning("Fix rank")
            workout.rank = 0
            var persistedExercises = [Exercise]()
            for (i, partialExercise) in zip(exercises.indices, exercises) {
                let exercise = Exercise(context: viewContext)
                exercise.rank = Double(i)
                exercise.name = partialExercise.name
                exercise.numReps = Int32(partialExercise.numReps ?? 0)
                exercise.numSeconds = Int32(partialExercise.numSeconds ?? 0)
                exercise.workout = workout
                persistedExercises.append(exercise)
            }

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }, label: {
            Text(String(localized: "Save"))
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(5)
        })
        .buttonStyle(.borderedProminent)
        .disabled(!isComplete)
        .padding(12)
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView()
    }
}

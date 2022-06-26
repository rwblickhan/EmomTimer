//
//  AddExercisesView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/23/22.
//

import SwiftUI

struct AddExercisesView: View {
    @Binding var exercises: [PartialExercise]

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach($exercises) { exercise in
                        AddExerciseCardView(exercise: exercise, onDelete: {
                            withAnimation {
                                exercises.removeAll(where: { $0.id == exercise.id })
                            }
                        })
                        .id(exercise.id)
                    }
                    .onChange(of: exercises.count) { _ in
                        withAnimation {
                            exercises.last.flatMap { proxy.scrollTo($0.id) }
                        }
                    }
                }
            }
            Spacer()
            addExerciseButton
        }
    }

    private var addExerciseButton: some View {
        Button(action: {
            withAnimation {
                exercises.append(PartialExercise(id: UUID(), rank: Double(exercises.count)))
            }
        }, label: {
            Text(String(localized: "Add Exercise"))
                .font(.headline)
                .padding(5)
        })
        .buttonStyle(.bordered)
    }
}

struct AddExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        AddExercisesView(exercises: .constant([PartialExercise(
            id: UUID(),
            name: "Test Exercise",
            numReps: 10,
            numSeconds: 60,
            rank: 0)]))
    }
}

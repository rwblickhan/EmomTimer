//
//  WorkoutsView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/17/22.
//

import SwiftUI

struct WorkoutsView: View {
    @State private var showSheet = false

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Workout.rank, ascending: false)],
        animation: .default)
    private var workouts: FetchedResults<Workout>

    init() {}

    var body: some View {
        NavigationView {
            List {
                ForEach(workouts) { workout in
                    WorkoutCardView(workout: workout)
                }
            }
            .navigationTitle(String(localized: "Workouts"))
            .toolbar { addButton }
            .sheet(isPresented: $showSheet) { AddWorkoutView() }
        }
    }

    private var addButton: some View {
        Button {
            showSheet = true
        } label: {
            Image(systemName: "plus")
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}

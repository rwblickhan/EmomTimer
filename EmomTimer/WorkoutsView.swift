//
//  WorkoutsView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/17/22.
//

import SwiftUI

struct WorkoutsView: View {
    @Environment(\.managedObjectContext) private var viewContext

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
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

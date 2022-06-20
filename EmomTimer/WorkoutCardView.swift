//
//  WorkoutCardView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/20/22.
//

import SwiftUI

struct WorkoutCardView: View {
    @ObservedObject var workout: Workout

    var body: some View {
        VStack(alignment: .leading) {
            Text(workout.name ?? "")
                .font(.headline)
            Text(DateComponentsFormatter().string(from: workout.timeInterval) ?? "")
                .font(.body)
        }
    }
}

struct WorkoutCardView_Previews: PreviewProvider {
    static var previews: some View {
        // swiftlint:disable force_try
        let workout = try! PersistenceController.preview.container.viewContext.fetch(Workout.fetchRequest()).first!
        WorkoutCardView(workout: workout)
    }
}

//
//  AboutView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/17/22.
//

import SwiftUI

enum AboutViewConfig {
    case emom
    case tabata

    var title: String {
        switch self {
        case .emom:
            return String(localized: "What is EMOM?", comment: "Headline for a view that explains EMOM")
        case .tabata:
            return String(localized: "What is Tabata?", comment: "Headline for a view that explains Tabata")
        }
    }

    var body: String {
        switch self {
        case .emom:
            return String(
                localized: "An acronym for \"every minute on the minute, EMOMs are HIIT-style workouts, in which you alternate between short, intense bursts of exercise with complete rest.\n\nEMOM workouts challenge you to complete an exercise for a certain number of reps in less than 60 seconds. The remaining time within the minute serves as your recovery.\n\nThey are very versatile - you can focus on cardio or strength, use bodyweight or equipment, and are usually anywhere from 4 to 45 minutes long.",
                comment: "Body for a view that explains EMOM")
        case .tabata:
            return String(
                localized: "In a Tabata workout, each round lasts four minutes. You alternate between 20 seconds of all-out intensity, followed by 10 seconds of rest, repeated eight times.",
                comment: "Body for a view that explains Tabata")
        }
    }
}

struct AboutView: View {
    let config: AboutViewConfig

    var body: some View {
        ScrollView {
            VStack {
                Text(config.title)
                    .font(.title)
                    .padding()
                Text(config.body)
                    .font(.body)
                    .padding()
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(config: .emom)
        AboutView(config: .tabata)
    }
}

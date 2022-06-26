//
//  AddExerciseCardView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/20/22.
//

import SwiftUI

struct AddExerciseCardView: View {
    private enum TimeType {
        case seconds
        case minutes
    }

    @Binding var exercise: PartialExercise
    @State private var timeType: TimeType = .seconds
    @State private var timeValue: Int? = nil

    var onDelete: (() -> Void)?

    var body: some View {
        VStack {
            HStack {
                TextField(String(localized: "Name Exercise"), text: $exercise.name)
                    .font(.headline)
                if onDelete != nil {
                    Button(action: {
                        onDelete?()
                    }, label: {
                        Image(systemName: "trash")
                    })
                    .frame(minWidth: 44, minHeight: 44)
                }
            }
            HStack {
                VStack {
                    TextField("3", value: $exercise.numReps, format: .number)
                        .font(.subheadline)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 44, maxHeight: 44)
                        .keyboardType(.decimalPad)

                    TextField("60", value: $timeValue, format: .number)
                        .font(.subheadline)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 44, maxHeight: 44)
                        .keyboardType(.decimalPad)
                        .onChange(of: timeValue, perform: onChangeTimeValue)
                }
                VStack(alignment: .leading) {
                    Text(String(localized: "Rounds"))
                        .font(.subheadline)
                        .frame(maxHeight: 44)
                    Picker(String(localized: "Time type"), selection: $timeType) {
                        Text(String(localized: "Seconds")).tag(TimeType.seconds)
                            .font(.subheadline)
                        Text(String(localized: "Minutes")).tag(TimeType.minutes)
                            .font(.subheadline)
                    }
                    .pickerStyle(.segmented)
                    .frame(maxHeight: 44)
                }
                Spacer()
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.blue, lineWidth: 1))
        .padding()
    }
    
    private func onChangeTimeValue(newValue: Int?) {
        if let newValue = newValue {
            switch timeType {
            case .seconds:
                exercise.numSeconds = newValue
            case .minutes:
                exercise.numSeconds = newValue * 60
            }
        } else {
            exercise.numSeconds = nil
        }
    }
}

struct AddExerciseCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseCardView(exercise: .constant(PartialExercise()))
        AddExerciseCardView(exercise: .constant(PartialExercise()), onDelete: {})
    }
}

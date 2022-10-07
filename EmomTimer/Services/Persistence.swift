//
//  Persistence.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/17/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let exercise1 = Exercise(context: viewContext)
        exercise1.name = "Mountain Climbers"
        exercise1.numReps = 30
        exercise1.numSeconds = 60
        exercise1.rank = 1

        let exercise2 = Exercise(context: viewContext)
        exercise2.name = "Burpees"
        exercise2.numReps = 15
        exercise2.numSeconds = 60
        exercise2.rank = 2

        let exercise3 = Exercise(context: viewContext)
        exercise3.name = "Air Squats"
        exercise3.numReps = 30
        exercise3.numSeconds = 60
        exercise3.rank = 3

        let workout1 = Workout(context: viewContext)
        workout1.name = "Triple Sweat"
        workout1.numRounds = 8
        workout1.exercises = NSOrderedSet(array: [exercise1, exercise2, exercise3])

        let exercise4 = Exercise(context: viewContext)
        exercise4.name = "Curtsy Lunges"
        exercise4.numReps = 25
        exercise4.numSeconds = 60
        exercise4.rank = 1

        let exercise5 = Exercise(context: viewContext)
        exercise5.name = "Push-Ups"
        exercise5.numReps = 12
        exercise5.numSeconds = 60
        exercise5.rank = 2

        let exercise6 = Exercise(context: viewContext)
        exercise6.name = "Dumbbell Rows"
        exercise6.numReps = 15
        exercise6.numSeconds = 60
        exercise6.rank = 3

        let exercise7 = Exercise(context: viewContext)
        exercise7.name = "Burpees"
        exercise7.numReps = 10
        exercise7.numSeconds = 60
        exercise7.rank = 4

        let exercise8 = Exercise(context: viewContext)
        exercise8.name = "Dumbbell Squat Push-Press"
        exercise8.numReps = 15
        exercise8.numSeconds = 60
        exercise8.rank = 5

        let exercise9 = Exercise(context: viewContext)
        exercise9.name = "Plank With Shoulder Taps"
        exercise9.numReps = 20
        exercise9.numSeconds = 60
        exercise9.rank = 6

        let exercise10 = Exercise(context: viewContext)
        exercise10.name = "Jump Rope"
        exercise10.numReps = 75
        exercise10.numSeconds = 60
        exercise10.rank = 7

        let workout2 = Workout(context: viewContext)
        workout2.name = "Full Body Express"
        workout2.numRounds = 2
        workout2
            .exercises =
            NSOrderedSet(array: [exercise4, exercise5, exercise6, exercise7, exercise8, exercise9, exercise10])

        let exercise11 = Exercise(context: viewContext)
        exercise11.name = "Pull-Ups"
        exercise11.numReps = 10
        exercise11.numSeconds = 60
        exercise11.rank = 1

        let exercise12 = Exercise(context: viewContext)
        exercise12.name = "Toes To Bar"
        exercise12.numReps = 10
        exercise12.numSeconds = 60
        exercise12.rank = 2

        let workout3 = Workout(context: viewContext)
        workout3.name = "Grip That Bar"
        workout3.numRounds = 4
        workout3.exercises = NSOrderedSet(array: [exercise11, exercise12])

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "EmomTimer")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

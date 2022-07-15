//
//  Desafio_03App.swift
//  Desafio-03
//
//  Created by MARCOS FELIPE SOARES ROCHA on 22/12/21.
//

import SwiftUI

@main
struct Desafio_03App: App {
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            DrinksView(viewModel: DrinksViewModel())
                .environment(
                    \.managedObjectContext,
                     persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
                case .background:
                    print("Scene is in background")
                    persistenceController.save()
                case .inactive:
                    print("Scene is inactive")
                case .active:
                    print("Scene is active")
                @unknown default:
                    print("Deu error aqui oh!")
            }
        }
    }
}

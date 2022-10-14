//
//  PortfolioDataService.swift
//  Braze
//
//  Created by Roy Aiyetin on 14/10/2022.
//

import Foundation
import CoreData

///Does all the logic to get portfolio data from Core Data
class PortfolioDataService {
    
    //set up coredata
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    ///Save result of call to fetch  from view context to this array. Bind & subscribe from other views in the app
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("error loading Core Data: \(error)")
            }
        }
        self.getPortfolio()
    }
    
    //MARK: PUBLIC
    func updatePortfolio(coin: CoinModel, amount: Double) {
        //check whether coin exists in Core Data (Portfolio) with its id
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                remove(entity: entity)
            }
        } else { // coin does not exist
            add(coin: coin, amount: amount)
        }
    }
    
    //MARK: PRIVATE
    //fetch all data inside container
    private func getPortfolio() {
        
        //create fetch request -> NSFetch is generic so we need to give it a specific result type
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request) //call to fetch
        } catch {
           print("Error fetching Portfolio Entities: \(error)")
        }
    }
    
    //add & save to the coredata. Pass type CoinModel which is what we are recieving as input & convert to portfolio
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
    }
    
    //save the context after the entity has been added to the context
    private func save() {
        do {
            try container.viewContext.save()
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
    
    //update coin
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    //remove a coin from Portfolio
    private func remove(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    ///Save the new context, re-fetch all coins from the context and set them to savedEntities var.
    /// - Update savedEntities Arr which will be pushed to subscribers -> call getPortfolio func again to create a new fetch request and save them to the arr
    private func applyChanges() {
        save()
        getPortfolio()
    }
    
}

//
//  ResultsView.swift
//  DiceGame
//
//  Created by saj panchal on 2021-09-09.
//

import SwiftUI

struct ResultsView: View {
    @FetchRequest(entity: Summary.entity(), sortDescriptors: []) var results: FetchedResults<Summary>
    @Environment(\.managedObjectContext) var moc
    

    var body: some View {
        List(results, id: \.self) { result in
            VStack {
                Text("Score: \(result.score)")
                    .font(.title)
                Text("\(result.currentDate)")
                    .font(.caption)
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}


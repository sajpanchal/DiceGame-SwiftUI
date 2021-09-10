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
        List(Array(zip(results.scores, results.currentDate)), id: \.self.1) { (ind, date) in
            VStack {
                Text("Score: \(ind)")
                    .font(.title)
                Text("\(date)")
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


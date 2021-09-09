//
//  ResultsView.swift
//  DiceGame
//
//  Created by saj panchal on 2021-09-09.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var results: Result

    var body: some View {
        List(Array(zip(results.scores, results.currentDate)), id: \.self.0) { (ind, date) in
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


//
//  ContentView.swift
//  DiceGame
//
//  Created by saj panchal on 2021-09-08.
//

import SwiftUI

struct ContentView: View {
    @State var diceValues = [1,2,3,4,5,6]
    @State var diceValue: Int = 0
    @State var angle: Double = 0.0
    @State var selectedTab = 0
    @State var generator = UINotificationFeedbackGenerator()
    @FetchRequest(entity: Summary.entity(), sortDescriptors:[]) var results: FetchedResults<Summary>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        TabView {
            VStack {
                Text("\(diceValue == 0 ? "Roll it": "\(diceValue)")")
                    .frame(width: 150, height: 150, alignment: .center)
                    .cornerRadius(3.0)
                    .background(Color.pink)
                    .cornerRadius(16)
                    .padding()
                    .font(.largeTitle)
                    .rotation3DEffect(
                        
                        .degrees(angle)
                        
                        ,
                        axis: (x: 1.0, y: 1.0, z: 1.0)
                    ).onTapGesture(perform:rollDice)
            }
            .tabItem {
                Image(systemName:"play")
                Text("Play")
            }
            .tag(0)
            ResultsView()/*.environmentObject(results)*/
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Results")
                }
                .tag(1)
        }
     
        
        
    }
    
    func rollDice() {
        withAnimation {
            self.angle += 720.0
            diceValue = diceValues.shuffled()[0]
            simpleSuccess()
        }
        
       let result = Summary(context: self.moc)
        result.score = Int16(diceValue)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        result.currentDate = formatter.string(from: Date())
        try? self.moc.save()
        
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

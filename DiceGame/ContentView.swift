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
    var body: some View {
        VStack {
            Text("\(diceValue == 0 ? "Roll dice": "\(diceValue)")")
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(3.0)
                .background(Color.pink)
                .padding()
                .font(.largeTitle)
                .rotation3DEffect(
                   
                        .degrees(angle)
                        
                    ,
                    axis: (x: 1.0, y: 1.0, z: 1.0)
                )
                
            Button(action: {
              
                withAnimation {
                    self.angle += 360.0
                    diceValue = diceValues.shuffled()[0]
                }
            }, label: {
                
                Text("Roll")
                
            })
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

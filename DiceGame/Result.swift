//
//  File.swift
//  DiceGame
//
//  Created by saj panchal on 2021-09-09.
//

import Foundation

class Result: ObservableObject {
   @Published var scores: [Int] = [Int]()
    @Published var currentDate: [String] = [String]()
    
}

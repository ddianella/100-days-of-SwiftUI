//
//  Card.swift
//  Project 17. Flashzilla
//
//  Created by Prince$$ Di on 11.08.2021.
//

import Foundation

struct Card : Codable {
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "What is the capital of Ukraine?", answer: "Kyiv")
    }
}

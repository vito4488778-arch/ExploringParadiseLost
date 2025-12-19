//
//  Question.swift
//  HW5
//
//  Created by 114iosClassStudent04 on 2025/11/10.
//

import Foundation
struct Question: Identifiable{
    let id = UUID()
    let text: String
    let options: [String]
    let answer: String
}

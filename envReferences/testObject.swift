//
//  testObject.swift
//  envReferences
//
//  Created by Nathaniel Mcdowell on 10/21/20.
//

import Foundation
import SwiftUI

class testObject:ObservableObject {
    @Published var num:Int = 0
    @Published var name:String = ""
}

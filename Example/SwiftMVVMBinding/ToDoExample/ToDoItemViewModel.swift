//
//  ToDoItemViewModel.swift
//  SwiftMVVMBinding
//
//  Created by Darren Clark on 2015-10-15.
//  Copyright © 2015 Darren Clark. All rights reserved.
//

import Foundation
import SwiftMVVMBinding


class ToDoItemViewModel: ViewModel {
    
    let title = Observable("")
    let completed = Observable(false)
    
    init() {
    }
    
    init(title: String) {
        self.title.value = title
    }
    
}

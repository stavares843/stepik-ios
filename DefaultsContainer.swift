//
//  DefaultsContainer.swift
//  Stepic
//
//  Created by Alexander Karpov on 07.04.17.
//  Copyright © 2017 Alex Karpov. All rights reserved.
//

import Foundation

/*
 Used to store application data, generated by an app
 */
class DefaultsContainer {
    private init() {}
    static let launch = LaunchDefaultsContainer()
}
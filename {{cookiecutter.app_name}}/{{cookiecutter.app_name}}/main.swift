//
//  main.swift
//  {{cookiecutter.app_name}}
//
//  Created by Piotr Gorzelany on 22.11.2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import Foundation
import UIKit

/// Checks if the app is being opened by the test target
///
/// - Returns: True if the app is opened by the test target
private func isRunningTests() -> Bool {
    return NSClassFromString("XCTestCase") != nil
}

/// Gets the right AppDelegate class for the current environment.
/// The real AppDelegate should not be used in testing since it may have side effects.
/// Side effects include making api calls, registering for notifications, setting core data, setting UI etc.
///
/// - Returns: TestsAppDelegate if the app was opened by the test target. Normal AppDelegate otherwise.
private func getDelegateClassName() -> String {
    return isRunningTests() ? NSStringFromClass(TestsAppDelegate.self) : NSStringFromClass(AppDelegate.self)
}

/// Load the actual app with the right app delegate depending on environment
/// Based on https://marcosantadev.com/fake-appdelegate-unit-testing-swift/
let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self,
                                                                      capacity: Int(CommandLine.argc))
UIApplicationMain(CommandLine.argc, args, nil, getDelegateClassName())
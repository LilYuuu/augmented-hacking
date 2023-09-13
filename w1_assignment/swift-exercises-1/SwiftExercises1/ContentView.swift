//
//  ContentView.swift
//  SwiftExercises1
//
//  Created by Nien Lam on 9/7/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI

@Observable
class ViewModel {
    var counterEven: Int  = 0
    var cycle: Int        = 5
    var fibonacci: Int    = 0
    var student: String   = "Jane"
    
    // EDIT CODE HERE: ////////////////////////////////////////////////

    // Add any local variables here.
    var a: Int = 0
    var b: Int = 1
    var sum: Int = 0
    var all_students: [String] = ["Anna", "Apoorva", "Briana", "Hank", "Haonan", "Hyunju", "Joann", "Lily", "Orpheas", "Shannon", "Stella", "Tom", "Wendy", "Xiaoan", "Xiaoran", "Zoe"]
    var idx: Int = 0

    
    // MARK: - 1. List even numbers

    // Add logic to list even numbers.
    func didPressCounterNext() {
        print("🔺 Did press counter next")
        print("Value: ", counterEven)

        counterEven += 2
    }

    // MARK: - 2. Cycle integers 5 to 0
    
    // Add logic to cycle integers 5 to 0.
    // e.g. 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 5, ...
    func didPressCycleNext() {
        print("🔺 Did press cycle next")
        print("Value: ", cycle)

        if cycle > 0 {
            cycle -= 1
        } else {
            cycle = 5
        }
    }

    // MARK: - 3. Fibonacci sequence
    
    // Add logic to list Fibonacci Sequence.
    func didPressFibonacciNext() {
        print("🔺 Did press Fibonacci next")
        print("Value: ", fibonacci)

        fibonacci = b
        sum = a + b
        a = b
        b = sum
    }

    // MARK: - 4. List students

    // Add logic to list all Augmented Hacking students.
    func didPressStudentNext() {
        print("🔺 Did press Student next")
        print("Value: ", student)

        if idx < all_students.count {
            student = all_students[idx]
            idx += 1
        }
    }

    // MARK: - Helper method to reset variables.

    // Reset any variables used.
    func didResetVariables() {
        print("🔺 Did reset variables")

        counterEven   = 0
        cycle         = 5
        fibonacci     = 0
        student       = "Jane"
        a             = 0
        b             = 1
        sum           = 0
        idx           = 0
    }

    ///////////////////////////////////////////////////////////////////
}


struct ContentView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            Text("Swift Exercises I")
                .font(.largeTitle)
                .padding(.top, 80)
            
            VStack {
                // 1.
                lineItem(title: "1. List even numbers", text: "\(viewModel.counterEven)", buttonColor: .blue) {
                    viewModel.didPressCounterNext()
                }
                Divider()

                // 2.
                lineItem(title: "2. Cycle integers 5 to 0", text: "\(viewModel.cycle)", buttonColor: .green) {
                    viewModel.didPressCycleNext()
                }
                Divider()

                // 3.
                lineItem(title: "3. Fibonacci sequence", text: "\(viewModel.fibonacci)", buttonColor: .red) {
                    viewModel.didPressFibonacciNext()
                }
                Divider()

                // 4.
                lineItem(title: "4. List students", text: "\(viewModel.student)", buttonColor: .purple) {
                    viewModel.didPressStudentNext()
                }
                Divider()
                
                // Reset button
                Button {
                    viewModel.didResetVariables()
                } label: {
                    resetLabel()
                }
                .padding(.top, 20)
            }
            .padding()
            .padding(.top, 20)
        }
    }
    
    // Helper function to line item.
    func lineItem(title: String, text: String, buttonColor: Color, action: @escaping () -> Void) -> some View {
        HStack {
            Text(title)
            Spacer()
            Text(text)
                .bold()
            
            Button {
                action()
            } label: {
                actionLabel(color: buttonColor)
            }
            .padding(.leading, 20)
        }
    }
    
    // Helper function to render action label.
    func actionLabel(color: Color) -> some View {
        Label("", systemImage: "chevron.forward.square")
            .font(.system(.title))
            .foregroundColor(.white)
            .labelStyle(IconOnlyLabelStyle())
            .frame(width: 44, height: 44)
            .background(color)
            .cornerRadius(4)
    }
    
    // Helper function to render reset label.
    func resetLabel() -> some View {
        Label("Reset", systemImage: "gobackward")
            .font(.system(.headline))
            .foregroundColor(.white)
            .frame(width: 120, height: 44)
            .background(Color.gray)
            .cornerRadius(4)
    }
}

//
//  TestViewModel.swift
//  TaskTEST
//
//  Created by Jae hyung Kim on 11/14/24.
//

import Foundation

final class TestViewModel: ObservableObject, ThreadCheckable {
    @Published private(set) var state = State()
    
    var highPriority: TaskPriority?
    var lowPriority: TaskPriority?
    var miPriority: TaskPriority?
    
    struct State {
        var a = 0
    }
    
    enum Action {
        case onApear
        case increment
        case clear
        case priority
    }
    
    func body(_ action: Action) {
        switch action {
        case .onApear:
            body(.clear)
            
        case .priority:
            for i in 0..<10 {
                Task {
                    Task(priority: .low) {
                        Task {
                            Task(priority: .high) {
                                let random = Double.random(in: 0..<2)
                                try await Task.sleep(for: .seconds(random))
                                
                                await MainActor.run {
                                    state.a -= i
                                    print("==>?")
                                    checkedMainThread()
                                }
                                print(Task.currentPriority)
                                print("나 부모2의 Low : ", Task.currentPriority)
                            }
                            print("나 부모2 : ", Task.currentPriority)
                        }
                        print("나 부모2 의 부모 : ", Task.currentPriority)
                    }
                    print("나 부모2 의 부모의 부모 : ", Task.currentPriority)
                    
                    Task(priority: .low) {
                        Task {
                            Task {
                                let random = Double.random(in: 0..<2)
                                try await Task.sleep(for: .seconds(random))
                                
                                await MainActor.run {
                                    state.a += i
                                    print("==>?")
                                    checkedMainThread()
                                }
                                print(Task.currentPriority)
                                print("나 부모2의 Low : ", Task.currentPriority)
                            }
                            print("나 부모2 : ", Task.currentPriority)
                        }
                        print("나 부모2 의 부모 : ", Task.currentPriority)
                    }
                }
            }
        case .clear:
            state.a = 0
            
        case .increment:
            body(.clear)
            
            Task(priority: .low) {
                Task {
                    Task {
                        Task(priority: .high) {
                            print( "마지막 자식 : \(Task.currentPriority)")
                        }
                        print( "둘째 자식 : \(Task.currentPriority)")
                    }
                    print( "첫 자식 : \(Task.currentPriority)")
                }
                print( "최상위 부모 : \(Task.currentPriority)")
            }
           
        }
    }
}

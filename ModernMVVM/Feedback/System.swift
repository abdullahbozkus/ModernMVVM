//
//  System.swift
//  ModernMVVMList
//
//  Created by Abdullah Bozkus on 5/26/22.
//  Copyright © 2022 Abdullah Bozkus. All rights reserved.
//

import Combine

extension Publishers {
    
    static func system<State, Event, Scheduler: Combine.Scheduler>(
        initial: State,
        reduce: @escaping (State, Event) -> State,
        scheduler: Scheduler,
        feedbacks: [Feedback<State, Event>]
    ) -> AnyPublisher<State, Never> {
        
        let state = CurrentValueSubject<State, Never>(initial)
        
        let events = feedbacks.map { feedback in feedback.run(state.eraseToAnyPublisher()) }
        
        return Deferred {
            Publishers.MergeMany(events)
                .receive(on: scheduler)
                .scan(initial, reduce)
                .handleEvents(receiveOutput: state.send)
                .receive(on: scheduler)
                .prepend(initial)
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}

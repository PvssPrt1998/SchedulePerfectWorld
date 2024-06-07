//
//  RingedLinkedList.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 17.05.2024.
//

import Foundation

class RingedLinkedList {
    var rootNode: Node
    var node: Node
    var count: Int = 1
    
    init(rootNode: Node) {
        self.rootNode = rootNode
        self.node = rootNode
    }
    
    deinit {
        rootNode.next = nil
    }
    
    func addNode(scheduleItem: ScheduleItem) {
        let node = Node(next: self.node, scheduleItem: scheduleItem)
        self.rootNode.next = node
        self.node = node
        count += 1
    }
    
    func crankList() {
        guard let node = node.next, let rootNode = rootNode.next else { return }
        self.node = node
        self.rootNode = rootNode
    }
    
    func crankList(times: Int) -> Node {
        for _ in 0..<times {
            crankList()
        }
        
        return self.node
    }
}

class Node {
    var next: Node?
    var scheduleItem: ScheduleItem
    
    init(next: Node? = nil, scheduleItem: ScheduleItem) {
        self.next = next
        self.scheduleItem = scheduleItem
    }
}

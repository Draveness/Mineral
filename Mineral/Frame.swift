//
//  MNFrameView.swift
//  Mineral
//
//  Created by draveness on 13/04/2017.
//  Copyright © 2017 draveness. All rights reserved.
//

import Foundation

public class Frame: Node, Container {
    public static func build(closure: (Frame) -> Void) -> Frame {
        let frame = Frame()
        closure(frame)
        return frame
    }
    
    @discardableResult public func build(_ node: Node) -> Relation<Frame> {
        view.addSubview(node.view)
        return Relation<Frame>(container: self, node: node)
    }
}

public class Relation<Container> {
    public let container: Container
    public let node: Node

    public init(container: Container, node: Node) {
        self.container = container
        self.node = node
    }
}

extension Relation where Container: Frame {
    @discardableResult public func origin(_ origin: CGPoint) -> Relation {
        node.view.origin = origin
        return self
    }
    
    @discardableResult public func origin(_ origin: CGFloat) -> Relation {
        node.view.origin = CGPoint(x: origin, y: origin)
        return self
    }
    
    @discardableResult public func origin(_ x: CGFloat, _ y :CGFloat) -> Relation {
        node.view.origin = CGPoint(x: x, y: y)
        return self
    }
    
    @discardableResult public func x(_ x: CGFloat) -> Relation {
        node.view.x = x
        return self
    }
    
    @discardableResult public func y(_ y: CGFloat) -> Relation {
        node.view.y = y
        return self
    }
    
    @discardableResult public func center(_ center: CGPoint) -> Relation {
        node.view.center = center
        return self
    }
    
    @discardableResult public func center(_ center: CGFloat) -> Relation {
        node.view.center = CGPoint(x: center, y: center)
        return self
    }
    
    @discardableResult public func center(_ centerX: CGFloat, _ centerY: CGFloat) -> Relation {
        node.view.center = CGPoint(x: centerX, y: centerY)
        return self
    }
    
    @discardableResult public func centerX(_ centerX: CGFloat) -> Relation {
        node.view.centerX = centerX
        return self
    }
    
    @discardableResult public func centerY(_ centerY: CGFloat) -> Relation {
        node.view.centerY = centerY
        return self
    }
}

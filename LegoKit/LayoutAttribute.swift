import UIKit

public protocol LayoutAttribute {
    var item: UIView { get }
    var type: NSLayoutAttribute { get }
    var constant: Float { get }
    var multiplier: Float { get }
}

// Extensions

extension LayoutAttribute {
    func makeConstraint(relation: NSLayoutRelation, toAttribute: LayoutAttribute) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: type, relatedBy: relation, toItem: toAttribute.item, attribute: toAttribute.type, multiplier: CGFloat(toAttribute.multiplier), constant: CGFloat(toAttribute.constant))
    }
    
    func makeConstraint(relation: NSLayoutRelation, constant: Float = 0, multiplier: Float = 1, priority: Float = 1000) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: type, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: CGFloat(multiplier), constant: CGFloat(constant))
    }
}

// Implementations

struct LayoutAttributeImpl: LayoutAttribute {
    let item: UIView
    let type: NSLayoutAttribute
    let constant: Float
    let multiplier: Float
    
    init(item: UIView, type: NSLayoutAttribute, constant: Float = 0, multiplier: Float = 1, priority: Float = 1000) {
        self.item = item
        self.type = type
        self.constant = constant
        self.multiplier = multiplier
    }
}

// Operators

public func ==(lhs: LayoutAttribute, rhs: LayoutAttribute) -> NSLayoutConstraint {
    return lhs.makeConstraint(.Equal, toAttribute: rhs)
}

public func ==(lhs: LayoutAttribute, rhs: Float) -> NSLayoutConstraint {
    return lhs.makeConstraint(.Equal, constant: rhs)
}

public func >=(lhs: LayoutAttribute, rhs: LayoutAttribute) -> NSLayoutConstraint {
    return lhs.makeConstraint(.GreaterThanOrEqual, toAttribute: rhs)
}

public func >=(lhs: LayoutAttribute, rhs: Float) -> NSLayoutConstraint {
    return lhs.makeConstraint(.GreaterThanOrEqual, constant: rhs)
}

public func <=(lhs: LayoutAttribute, rhs: LayoutAttribute) -> NSLayoutConstraint {
    return lhs.makeConstraint(.LessThanOrEqual, toAttribute: rhs)
}

public func <=(lhs: LayoutAttribute, rhs: Float) -> NSLayoutConstraint {
    return lhs.makeConstraint(.LessThanOrEqual, constant: rhs)
}

public func +(lhs: LayoutAttribute, rhs: Float) -> LayoutAttribute {
    return LayoutAttributeImpl(item: lhs.item, type: lhs.type, constant: rhs, multiplier: lhs.multiplier)
}

public func -(lhs: LayoutAttribute, rhs: Float) -> LayoutAttribute {
    return LayoutAttributeImpl(item: lhs.item, type: lhs.type, constant: -rhs, multiplier: lhs.multiplier)
}

public func *(lhs: LayoutAttribute, rhs: Float) -> LayoutAttribute {
    return LayoutAttributeImpl(item: lhs.item, type: lhs.type, constant: lhs.constant, multiplier: rhs)
}

public func /(lhs: LayoutAttribute, rhs: Float) -> LayoutAttribute {
    return LayoutAttributeImpl(item: lhs.item, type: lhs.type, constant: lhs.constant, multiplier: 1 / rhs)
}

infix operator ! { associativity left precedence 120 }
public func !(lhs: NSLayoutConstraint, rhs: Float) -> NSLayoutConstraint {
    lhs.priority = rhs
    return lhs
}

infix operator |> { associativity left precedence 80 }
public func |>(lhs: UIView, rhs: NSLayoutConstraint) {
    lhs.addConstraint(rhs)
}

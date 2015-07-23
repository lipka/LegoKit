import UIKit

public extension UIView {
    
    public func attribute(type: NSLayoutAttribute) -> LayoutAttribute {
        return LayoutAttributeImpl(item: self, type: type)
    }
}

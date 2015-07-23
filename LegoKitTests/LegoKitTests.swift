import XCTest
@testable import LegoKit

class LegoKitTests: XCTestCase {
    
    let view1 = UIView()
    let view2 = UIView()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAttributes() {
        let c1 = view1.attribute(.Width) == view2.attribute(.Height)

        XCTAssert(c1.firstItem as? UIView == view1)
        XCTAssert(c1.firstAttribute == .Width)
        XCTAssert(c1.secondItem as? UIView == view2)
        XCTAssert(c1.secondAttribute == .Height)
        XCTAssert(c1.constant == 0)
        XCTAssert(c1.multiplier == 1)
        XCTAssert(c1.priority == 1000)
    }
    
    func testConstants() {
        let c1 = view1.attribute(.Width) == 100
        
        XCTAssert(c1.firstItem as? UIView == view1)
        XCTAssert(c1.firstAttribute == .Width)
        XCTAssert(c1.secondItem == nil)
        XCTAssert(c1.secondAttribute == .NotAnAttribute)
        XCTAssert(c1.constant == 100)
        XCTAssert(c1.multiplier == 1)
        XCTAssert(c1.priority == 1000)
        
        let c2 = view1.attribute(.Width) == view2.attribute(.Height) + 10
        
        XCTAssert(c2.firstItem as? UIView == view1)
        XCTAssert(c2.firstAttribute == .Width)
        XCTAssert(c2.secondItem as? UIView == view2)
        XCTAssert(c2.secondAttribute == .Height)
        XCTAssert(c2.constant == 10)
        XCTAssert(c2.multiplier == 1)
        XCTAssert(c2.priority == 1000)
        
        let c3 = view1.attribute(.Width) == view2.attribute(.Height) - 10
        
        XCTAssert(c3.firstItem as? UIView == view1)
        XCTAssert(c3.firstAttribute == .Width)
        XCTAssert(c3.secondItem as? UIView == view2)
        XCTAssert(c3.secondAttribute == .Height)
        XCTAssert(c3.constant == -10)
        XCTAssert(c3.multiplier == 1)
        XCTAssert(c3.priority == 1000)
    }
    
    func testMultiplier() {
        let c1 = view1.attribute(.Width) == view2.attribute(.Height) * 2
        
        XCTAssert(c1.firstItem as? UIView == view1)
        XCTAssert(c1.firstAttribute == .Width)
        XCTAssert(c1.secondItem as? UIView == view2)
        XCTAssert(c1.secondAttribute == .Height)
        XCTAssert(c1.constant == 0)
        XCTAssert(c1.multiplier == 2)
        XCTAssert(c1.priority == 1000)
        
        let c2 = view1.attribute(.Width) == view2.attribute(.Height) / 2
        
        XCTAssert(c2.firstItem as? UIView == view1)
        XCTAssert(c2.firstAttribute == .Width)
        XCTAssert(c2.secondItem as? UIView == view2)
        XCTAssert(c2.secondAttribute == .Height)
        XCTAssert(c2.constant == 0)
        XCTAssert(c2.multiplier == 1 / 2)
        XCTAssert(c2.priority == 1000)
    }
    
    func testPriority() {
        let c1 = view1.attribute(.Width) == view2.attribute(.Height) ! 500
        
        XCTAssert(c1.firstItem as? UIView == view1)
        XCTAssert(c1.firstAttribute == .Width)
        XCTAssert(c1.secondItem as? UIView == view2)
        XCTAssert(c1.secondAttribute == .Height)
        XCTAssert(c1.constant == 0)
        XCTAssert(c1.multiplier == 1)
        XCTAssert(c1.priority == 500)
    }
    
    func testComplex() {
        let c1 = view1.attribute(.Width) == view2.attribute(.Height) * 2 - 50 ! 500
        
        XCTAssert(c1.firstItem as? UIView == view1)
        XCTAssert(c1.firstAttribute == .Width)
        XCTAssert(c1.secondItem as? UIView == view2)
        XCTAssert(c1.secondAttribute == .Height)
        XCTAssert(c1.constant == -50)
        XCTAssert(c1.multiplier == 2)
        XCTAssert(c1.priority == 500)
    }
    
    func testOperator() {
        let containerView = UIView(), childView = UIView()
        containerView |> childView.attribute(.Width) == containerView.attribute(.Width)
        
        XCTAssert(containerView.constraints.count == 1)
    }
}

//
//  AVLTreeTests.swift
//  Tests
//
//  Created by Nicky Taylor on 11/22/22.
//

import XCTest
@testable import TreeTests

final class AVLTreeSimpleTests: XCTestCase {
    
    func testInsertOneElement() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        XCTAssert(tree.count == 1)
    }
    
    func testInsertThreeElements() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        XCTAssert(tree.count == 3)
    }
    
    func testInsertThreeElementsAndClear() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        XCTAssert(tree.count == 3)
        tree.clear()
        XCTAssert(tree.count == 0)
    }
    
    func testInsertFiveElementsWithTwoDuplicates() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        tree.insert(1)
        tree.insert(2)
        XCTAssert(tree.count == 3)
    }
    
    func testInsertThreePopMin() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        
        XCTAssert(tree.popMin() == 1)
        XCTAssert(tree.popMin() == 2)
        XCTAssert(tree.popMin() == 3)
        XCTAssert(tree.count == 0)
    }
    
    func testInsertThreePopMax() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        XCTAssert(tree.popMax() == 3)
        XCTAssert(tree.popMax() == 2)
        XCTAssert(tree.popMax() == 1)
        XCTAssert(tree.count == 0)
    }
    
    func testInsertThreeRemoveOneByOneVersion01() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion02() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion03() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion04() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion05() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion06() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    
    func testInsertThreeRemoveOneByOneVersion07() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(3)
        tree.insert(2)
        
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion08() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(3)
        tree.insert(2)
        
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion09() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(3)
        tree.insert(2)
        
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion10() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(3)
        tree.insert(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion11() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(3)
        tree.insert(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion12() {
        let tree = AVLTree<Int>()
        tree.insert(1)
        tree.insert(3)
        tree.insert(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    
    func testInsertThreeRemoveOneByOneVersion13() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(1)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion14() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(1)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion15() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(1)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion16() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(1)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion17() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(1)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion18() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(1)
        tree.insert(3)
        
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    
    func testInsertThreeRemoveOneByOneVersion19() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(3)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion20() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(3)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion21() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(3)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion22() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(3)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion23() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(3)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion24() {
        let tree = AVLTree<Int>()
        tree.insert(2)
        tree.insert(3)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion25() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(1)
        tree.insert(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion26() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(1)
        tree.insert(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion27() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(1)
        tree.insert(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion28() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(1)
        tree.insert(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion29() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(1)
        tree.insert(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion30() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(1)
        tree.insert(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion31() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(2)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion32() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(2)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion33() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(2)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion34() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(2)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion35() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(2)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
    func testInsertThreeRemoveOneByOneVersion36() {
        let tree = AVLTree<Int>()
        tree.insert(3)
        tree.insert(2)
        tree.insert(1)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(3)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 2)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 1)
        XCTAssert(tree.select(1) == 2)
        
        tree.remove(2)
        
        XCTAssert(tree.getMin() == 1)
        XCTAssert(tree.getMax() == 1)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 1)
        
        tree.remove(1)
        
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }

    func testKnownFailureCase1() {
        let input = [0, 2, 3, 1]
        let tree = AVLTree<Int>()
        for value in input {
            tree.insert(value)
        }
        XCTAssert(tree.select(0) == 0)
        XCTAssert(tree.select(1) == 1)
        XCTAssert(tree.select(2) == 2)
        XCTAssert(tree.select(3) == 3)
    }
    
    func testKnownFailureCase2() {
        let tree = AVLTree<Int>()
        
        tree.insert(0)
        tree.insert(1)
        tree.insert(2)
        tree.insert(3)
        
        XCTAssert(tree.getMin() == 0)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 4)
        XCTAssert(tree.select(0) == 0)
        XCTAssert(tree.select(1) == 1)
        XCTAssert(tree.select(2) == 2)
        XCTAssert(tree.select(3) == 3)
        
        tree.remove(1)
        XCTAssert(tree.getMin() == 0)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 3)
        XCTAssert(tree.select(0) == 0)
        XCTAssert(tree.select(1) == 2)
        XCTAssert(tree.select(2) == 3)
        
        tree.remove(0)
        XCTAssert(tree.getMin() == 2)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 2)
        XCTAssert(tree.select(0) == 2)
        XCTAssert(tree.select(1) == 3)
        
        tree.remove(2)
        XCTAssert(tree.getMin() == 3)
        XCTAssert(tree.getMax() == 3)
        XCTAssert(tree.count == 1)
        XCTAssert(tree.select(0) == 3)
        
        tree.remove(3)
        XCTAssert(tree.getMin() == nil)
        XCTAssert(tree.getMax() == nil)
        XCTAssert(tree.count == 0)
        XCTAssert(tree.select(0) == nil)
    }
    
}

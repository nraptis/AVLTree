//
//  AVLTree.swift
//  TreeTests
//
//  Created by Nicky Taylor on 11/21/22.
//

import Foundation

//https://algs4.cs.princeton.edu/code/edu/princeton/cs/algs4/AVLTreeST.java.html

class AVLTree<Element: Comparable>: BinarySearchTreeConforming {
    
    
    
    //typealias BinaryTreeNode = AVLTreeNode<Element>
    
    var root: AVLTreeNode<Element>?
    
    final class AVLTreeNode<Element>: BinaryTreeNodeConforming {
        var value: Element
        var height: Int
        var count: Int
        var left: AVLTreeNode<Element>?
        var right: AVLTreeNode<Element>?
        init(value: Element, height: Int, count: Int) {
            self.value = value
            self.height = height
            self.count = count
        }
    }
    
    var count: Int { count(root) }
    
    func clear() {
        root = nil
    }
    
    /*
    private func clear(_ node: BinaryTreeNode?) {
        guard let node = node else { return }
        clear(node.left)
        node.left = nil
        clear(node.right)
        node.right = nil
    }
    */
    
    private func count(_ node: BinaryTreeNode?) -> Int {
        node?.count ?? 0
    }
    
    func height() -> Int {
        height(root)
    }
    
    private func height(_ node: BinaryTreeNode?) -> Int {
        node?.height ?? -1
    }
    
    func contains(_ element: Element) -> Bool {
        contains(element, root)
    }
    
    func contains(_ element: Element, _ node: BinaryTreeNode?) -> Bool {
        guard let node = node else { return false }
        if element < node.value {
            return contains(element, node.left)
        } else if element > node.value {
            return contains(element, node.right)
        } else {
            return true
        }
    }
    
    func insert(_ element: Element) {
        root = insert(root, element)
    }
    
    private func insert(_ node: BinaryTreeNode?, _ element: Element) -> BinaryTreeNode {
        guard let node = node else {
            return BinaryTreeNode(value: element, height: 0, count: 1)
        }
        if element < node.value {
            node.left = insert(node.left, element)
        } else if element > node.value {
            node.right = insert(node.right, element)
        } else {
            return node
        }
        node.count = 1 + count(node.left) + count(node.right)
        node.height = 1 + max(height(node.left), height(node.right))
        return balance(node)
    }
    
    func remove(_ element: Element) {
        if !contains(element) { return }
        root = remove(root, element)
    }
    
    private func remove(_ node: BinaryTreeNode?, _ element: Element) -> BinaryTreeNode? {
        
        guard var node = node else {
            print("Attempting illegal remove")
            return nil
        }
        
        //int cmp = key.compareTo(x.key);
        //if (cmp < 0) {
        if element < node.value {
            //x.left = delete(x.left, key);
            node.left = remove(node.left, element)
        } else if element > node.value {
            //else if (cmp > 0) {
            
            //x.right = delete(x.right, key);
            node.right = remove(node.right, element)
        } else {
            
            /*
             if (x.left == null) {
             return x.right;
             }
             else if (x.right == null) {
             return x.left;
             }
             */
            
            if node.left == nil {
                return node.right
            } else if node.right == nil {
                return node.left
            } else {
                
                //Node y = x;
                let y = node
                
                //x = min(y.right);
                if let right = y.right {
                    node = right
                    while let left = node.left {
                        node = left
                    }
                }

                //x.right = deleteMin(y.right);
                if let right = y.right {
                    if let replacement = removeMin(right) {
                        node.right = replacement
                    } else {
                        node.right = nil
                    }
                }
                
                
                //x.left = y.left;
                node.left = y.left
                
                
                
                /*
                //Node y = x;
                
                
                //x = min(y.right);
                //node = getMinNode()
                if let right = node.right {
                    if let replacement = removeMin(right) {
                        node = replacement
                    }
                    /*
                    while let left = node.left {
                        node = left
                    }
                    */
                }
                
                //x.right = deleteMin(y.right);
                if let right = node.right {
                    node.right = removeMin(right)
                } else {
                    node.right = nil
                }
                
                
                //x.left = y.left;
                 node.left = y.left
                */
            }
            
            /*
             else {
             Node y = x;
             x = min(y.right);
             x.right = deleteMin(y.right);
             x.left = y.left;
             }
             */
        }
        
        
        //x.size = 1 + size(x.left) + size(x.right);
        node.count = 1 + count(node.left) + count(node.right)
        
        //x.height = 1 + Math.max(height(x.left), height(x.right));
        node.height = 1 + max(height(node.left), height(node.right))
        
        //return balance(x);
        return balance(node)
    }
    
    
    private func rotateRight(_ node: BinaryTreeNode) -> BinaryTreeNode {
        
        
        //Node y = x.left;
        guard let y = node.left else {
            print("Attempting illegal rotateRight")
            return node
        }
        
        //x.left = y.right;
        node.left = y.right
        
        //y.right = x;
        y.right = node
        
        //y.size = x.size;
        y.count = node.count
        
        //x.size = 1 + size(x.left) + size(x.right);
        node.count = 1 + count(node.left) + count(node.right)
        
        //x.height = 1 + Math.max(height(x.left), height(x.right));
        node.height = 1 + max(height(node.left), height(node.right))
        
        //y.height = 1 + Math.max(height(y.left), height(y.right));
        y.height = 1 + max(height(y.left), height(y.right))
        
        return y
    }
    
    private func rotateLeft(_ node: BinaryTreeNode) -> BinaryTreeNode {
        
        //Node y = x.right;
        guard let y = node.right else {
            print("Attempting illegal rotateLeft")
            return node
        }
        
        //x.right = y.left;
        node.right = y.left
        
        //y.left = x;
        y.left = node
        
        //y.size = x.size;
        y.count = node.count
        
        //x.size = 1 + size(x.left) + size(x.right);
        node.count = 1 + count(node.left) + count(node.right)
        
        //x.height = 1 + Math.max(height(x.left), height(x.right));
        node.height = 1 + max(height(node.left), height(node.right))
        
        //y.height = 1 + Math.max(height(y.left), height(y.right));
        y.height = 1 + max(height(y.left), height(y.right))
        
        return y
    }
    
    private func balanceFactor(_ node: BinaryTreeNode) -> Int {
        return height(node.left) - height(node.right)
    }
    
    private func balance(_ node: BinaryTreeNode) -> BinaryTreeNode {
        
        var x = node
        //if (balanceFactor(x) < -1) {
        if balanceFactor(x) < -1 {
            
            //if (balanceFactor(x.right) > 0) {
            if let right = x.right {
                if balanceFactor(right) > 0 {
                    //x.right = rotateRight(x.right);
                    x.right = rotateRight(right)
                }
            }
            //x = rotateLeft(x);
            x = rotateLeft(x)
            
        //else if (balanceFactor(x) > 1) {
        } else if balanceFactor(x) > 1 {
            // if (balanceFactor(x.left) < 0) {
            if let left = x.left {
                if balanceFactor(left) < 0 {
                    //x.left = rotateLeft(x.left);
                    x.left = rotateLeft(left)
                }
            }
            //x = rotateRight(x);
            x = rotateRight(x)
        }
        return x;
    }
    
    
    func popMin() -> Element? {
        let result = getMin()
        removeMin()
        return result
    }
    
    func getMin() -> Element? {
        guard var node = root else { return nil }
        while let left = node.left {
            node = left
        }
        return node.value
    }
    
    private func getMinNode() -> BinaryTreeNode? {
        guard var node = root else { return nil }
        while let left = node.left {
            node = left
        }
        return node
    }
    
    private func getMinNode(_ node: BinaryTreeNode?) -> BinaryTreeNode? {
        guard var node = node else { return nil }
        while let left = node.left {
            node = left
        }
        return node
    }
    
    func removeMin() {
        guard let node = root else { return }
        root = removeMin(node)
    }
    
    func removeMin(_ node: BinaryTreeNode) -> BinaryTreeNode? {
        
        //if (x.left == null) return x.right;
        if node.left == nil {
            return node.right
        }
        
        //x.left = deleteMin(x.left);
        if let left = node.left {
            node.left = removeMin(left)
        } else {
            node.left = nil
        }
        
        //x.size = 1 + size(x.left) + size(x.right);
        node.count = 1 + count(node.left) + count(node.right)
        
        //x.height = 1 + Math.max(height(x.left), height(x.right));
        node.height = 1 + max(height(node.left), height(node.right))
        
        //return balance(x);
        return balance(node)
    }
    
    func popMax() -> Element? {
        let result = getMax()
        removeMax()
        return result
    }
    
    func getMax() -> Element? {
        guard var node = root else { return nil }
        while let right = node.right {
            node = right
        }
        return node.value
    }
    
    private func getMaxNode() -> BinaryTreeNode? {
        guard var node = root else { return nil }
        while let right = node.right {
            node = right
        }
        return node
    }
    
    private func getMaxNode(_ node: BinaryTreeNode?) -> BinaryTreeNode? {
        guard var node = node else { return nil }
        while let right = node.right {
            node = right
        }
        return node
    }
    
    func removeMax() {
        guard let node = root else { return }
        root = removeMax(node)
    }
    
    func removeMax(_ node: BinaryTreeNode) -> BinaryTreeNode? {
        //if (x.right == null) return x.left;
        if node.right == nil {
            return node.left
        }
        
        //x.right = deleteMax(x.right);
        if let right = node.right {
            node.right = removeMax(right)
        } else {
            node.right = nil
        }
        
        //x.size = 1 + size(x.left) + size(x.right);
        node.count = 1 + count(node.left) + count(node.right)
        
        //x.height = 1 + Math.max(height(x.left), height(x.right));
        node.height = 1 + max(height(node.left), height(node.right))
        
        //return balance(x);
        return balance(node)
    }
    
    func select(_ index: Int) -> Element? {
        if index < 0 { return nil }
        if index >= count { return nil }
        guard let node = root else { return nil }
        return select(node, index).value
    }
    
    func select(_ node: BinaryTreeNode, _ index: Int) -> BinaryTreeNode {
        let t = count(node.left)
        if let left = node.left, t > index {
            return select(left, index)
        } else if let right = node.right, t < index {
            return select(right, index - t - 1)
        } else {
            return node
        }
    }
    
}

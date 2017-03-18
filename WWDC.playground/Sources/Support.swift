import Foundation


public extension Array {
    var random: Element {
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
}

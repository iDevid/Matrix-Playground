import Foundation


public extension Array {
    var random: Element {
        return self[Int(arc4random_uniform(UInt32(count)))]
    }
}

public func asyncDelay(seconds: TimeInterval, completion: @escaping () -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + seconds, execute: completion)
}

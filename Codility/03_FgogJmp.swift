import Foundation
import Glibc

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    return ((Y - X) / D) + ((Y - X) % D != 0 ? 1 : 0)
}

///
/// Tae Won Ha - http://taewon.de - @hataewon
/// See LICENSE
///

import Foundation
import FzyC

public func hasMatch(needle: String, haystack: String) -> Bool {
  needle.withCString { n in
    haystack.withCString { h in FzyC.has_match(n, h) != 0 }
  }
}

public func matchScore(needle: String, haystack: String) -> Double {
  needle.withCString { n in
    haystack.withCString { h in FzyC.match(n, h) }
  }
}

public func matchScoreAndPositions(
  needle: String,
  haystack: String
) -> (score: Double, positions: [Int]) {
  var positions = [Int](repeating: -1, count: min(needle.count, Int(FzyC.MATCH_MAX_LEN)))
  return needle.withCString { n in
    haystack.withCString { h in (FzyC.match_positions(n, h, &positions), positions) }
  }
}

public final class FzyMatcher: Sendable {
  public let needle: String

  public init(needle: String) {
    self.needle = needle
    self.needleCstr = Array(needle.utf8CString)
  }

  public func hasMatch(_ haystack: String) -> Bool {
    haystack.withCString { h in FzyC.has_match(self.needleCstr, h) != 0 }
  }

  public func score(_ haystack: String) -> Double {
    haystack.withCString { h in FzyC.match(self.needleCstr, h) }
  }

  public func scoreAndPositions(_ haystack: String) -> (score: Double, positions: [Int]) {
    // needleCstr.count - 1 since C strings are NULL terminated.
    var positions = [Int](repeating: -1, count: min(needleCstr.count - 1, Int(FzyC.MATCH_MAX_LEN)))
    return haystack.withCString { h in
      (FzyC.match_positions(self.needleCstr, h, &positions), positions)
    }
  }

  private let needleCstr: [CChar]
}

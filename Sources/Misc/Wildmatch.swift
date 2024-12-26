///
/// Tae Won Ha - http://taewon.de - @hataewon
/// See LICENSE
///

import Foundation
import WildmatchC

public struct Flag: OptionSet, Sendable {
  public let rawValue: Int32

  public init(rawValue: Int32) { self.rawValue = rawValue }

  /// Disable backslash escaping.
  public static let noEscape = Flag(rawValue: 0x01)

  /// Slash must be matched by slash.
  public static let pathname = Flag(rawValue: 0x02)

  /// Period must be matched by period.
  public static let period = Flag(rawValue: 0x04)

  /// Ignore /<tail> after Imatch.
  public static let leadingDir = Flag(rawValue: 0x08)

  /// Case insensitive search.
  public static let casefold = Flag(rawValue: 0x10)

  /// Unused
  public static let prefixDirs = Flag(rawValue: 0x20)

  /// Double-asterisks ** matches slash too. This flag implies Flag.pathname and Flag.period.
  public static let wildstar = Flag(rawValue: 0x40)
}

public func wildmatch(pattern: String, string: String, flags: Flag = .wildstar) -> Bool {
  pattern.withCString { patternCstr in
    string.withCString { stringCstr in
      wildmatch(patternCstr, stringCstr, flags.rawValue) == WM_MATCH
    }
  }
}

public final class Wildmatcher {
  public let pattern: String

  public init(pattern: String) {
    self.pattern = pattern
    self.patternCstr = Array(pattern.utf8CString)
  }

  public func matches(string: String, flags: Flag = .wildstar) -> Bool {
    string.withCString {
      stringCstr in wildmatch(patternCstr, stringCstr, flags.rawValue) == WM_MATCH
    }
  }

  private let patternCstr: [CChar]
}

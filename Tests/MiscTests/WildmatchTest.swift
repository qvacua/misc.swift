///
/// Tae Won Ha - http://taewon.de - @hataewon
/// See LICENSE
///

@testable import Misc
import Nimble
import XCTest

final class WildmatchTest: XCTestCase {
  func testMatcher() {
    let matcher = Wildmatcher(pattern: "**/folder")
    expect(matcher.matches(string: "some/test/folder")).to(beTrue())
    expect(matcher.matches(string: "some")).to(beFalse())
  }

  func testMatch() {
    expect(wildmatch(pattern: "**/folder", string: "folder")).to(beTrue())
  }

  func testOptions() {
    let matcher = Wildmatcher(pattern: "**/folder")
    expect(matcher.matches(string: "some/test/folder", flags: .pathname)).to(beFalse())

    expect(wildmatch(pattern: "**/folder", string: "some/test/folder", flags: .pathname))
      .to(beFalse())
  }
}

///
/// Tae Won Ha - http://taewon.de - @hataewon
/// See LICENSE
///

@testable import Misc
import Nimble
import XCTest

final class FzyTests: XCTestCase {
  func testHasMatch() {
    expect(hasMatch(needle: "abc", haystack: "abc")).to(beTrue())
    expect(hasMatch(needle: "abc", haystack: "zkx")).to(beFalse())
  }

  func testMatch() {
    expect(matchScore(needle: "nvs", haystack: "NvimView.swift"))
      .to(beGreaterThan(matchScore(needle: "nvs", haystack: "NvimView.c")))
  }

  func testMatchPositions() {
    let (score, positions) = matchScoreAndPositions(needle: "nvs", haystack: "/1/3/NvimView.swift")
    expect(score).to(beGreaterThan(0))
    expect(positions).to(equal([5, 6, 14]))
  }
}

final class FzyMatcherTests: XCTestCase {
  func testHasMatch() {
    let matcher = FzyMatcher(needle: "abc")
    expect(matcher.hasMatch("abc")).to(beTrue())
    expect(matcher.hasMatch("xyz")).to(beFalse())
  }

  func testMatch() {
    let matcher = FzyMatcher(needle: "nvs")
    expect(matcher.score("NvimView.swift")).to(beGreaterThan(matcher.score("NvimView.c")))
  }

  func testMatchPositions() {
    let matcher = FzyMatcher(needle: "nvs")
    let (score, positions) = matcher.scoreAndPositions("/1/3/NvimView.swift")
    expect(score).to(beGreaterThan(0))
    expect(positions).to(equal([5, 6, 14]))
  }

  func testMatchPositionsKorean() {
    let matcher = FzyMatcher(needle: "하태원")
    let (score, positions) = matcher.scoreAndPositions("/1/하/some/태원/테스트")
    expect(score).to(beGreaterThan(0))
    expect(positions).to(equal([3, 4, 5, 12, 13, 14, 15, 16, 17]))
  }
}

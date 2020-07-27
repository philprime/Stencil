import Quick
import Nimble
@testable import Stencil
import Foundation

class RegexOperatorSpec: QuickSpec {

    override func spec() {
        describe("Regex Operator") {
            it("should return captures if matched") {
                let regex = try! Regex(pattern: "(\\d+)(\\d+)")
                let result = regex ~= "1234"
                expect(result?.captures) == ["123", "4"]
            }

            it("should return nil if not matched") {
                let regex = try! Regex(pattern: "(\\d+)(\\d+)")
                let result = regex ~= ""
                expect(result).to(beNil())
            }
        }
    }
}

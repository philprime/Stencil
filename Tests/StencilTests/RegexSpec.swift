import Quick
import Nimble
@testable import Stencil

final class RegexSpec: QuickSpec {

    override func spec() {
        describe("Regex") {
            describe("initialiser") {
                context("invalid regex") {
                    it("should fail") {
                        expect {
                            _ = try Regex(pattern: "[.*")
                        }.to(throwError())
                    }
                }

                context("valid regex") {
                    it("should succeed") {
                        expect {
                            _ = try Regex(pattern: ".*")
                        }.toNot(throwError())
                    }
                }
            }

            describe("matching") {
                context("no groups given") {
                    it("should return no captures") {
                        let regex = try! Regex(pattern: "\\d+")
                        let result = regex.match(in: "123")
                        expect(result.captures) == []
                    }
                }

                context("one group given") {
                    it("should return the found group") {
                        let regex = try! Regex(pattern: "(\\d+)")
                        let result = regex.match(in: "123")
                        expect(result.captures) == ["123"]
                    }
                }

                context("one group requested but none found") {
                    it("should return an empty captures") {
                        let regex = try! Regex(pattern: "(\\d+)")
                        let result = regex.match(in: "")
                        expect(result.captures) == []
                    }
                }
            }
        }
    }
}

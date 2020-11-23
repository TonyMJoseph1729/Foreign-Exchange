
import Foundation

//Model to fetch compared Rates in a Date
struct CurrencyComparisonDetails: Codable {
    let success, historical: Bool?
    let date: String?
    let timestamp: Int?
    let base: String?
    let rates: [String:Double]?
    let error: CurrencyAPIError?
}

struct CurrencyAPIError: Codable {
    let code: Int?
    let info: String?
}

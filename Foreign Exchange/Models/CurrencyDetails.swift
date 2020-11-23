
import Foundation

//Model to fetch conversion rates
struct CurrencyDetails: Codable {
    let success: Bool?
    let timestamp: Int?
    let base, date: String?
    let rates: [String:Double]?
    let error: CurrencyAPIError?

}


import Foundation

struct CurrencyConstants {
    static let usd = "USD"
    static let gbp = "GBP"
    static let jpy = "JPY"
    static let aud = "AUD"
    static let cad = "CAD"
    static let chf = "CHF"
    static let eur = "EUR"
    static let cny = "CNY"
    static let sek = "SEK"
    static let nzd = "NZD"

}

struct UIConstants {
    static let currencyComparisonVCIdentifier = "currencyComparisonVC"
    static let currencyComparisonCellIdentifier = "currencyComparisonCell"
    static let currencyDetailsCellIdentifier = "currencyDetailsCell"
}

struct ErrorConstants {
    static let errorTitle = "Error"
    static let genericErrorMessage = "Some Error Occured"
}

struct AlertConstants {
    static let comparingRatesMessage = "Comparing Rates"
    static let fetchingRatesMessage = "Fetching Rates"
}

// Types of errors: Error Messages based on error code as error messeage keys are not consistent in the API
struct APIErrorMessageConstants {
    static let errorMessage404 = "The requested resource does not exist."
    static let errorMessage101 = "No API Key was specified or an invalid API Key was specified."
    static let errorMessage103 = "The requested API endpoint does not exist."
    static let errorMessage104 = "The maximum allowed API amount of monthly API requests has been reached."
    static let errorMessage105 = "The current subscription plan does not support this API endpoint."
    static let errorMessage106 = "The current request did not return any results."
    static let errorMessage102 = "The account this API request is coming from is inactive."
    static let errorMessage201 = "An invalid base currency has been entered."
    static let errorMessage202 = "One or more invalid symbols have been specified."
    static let errorMessage301 = "No date has been specified."
    static let errorMessage302 = "An invalid date has been specified."
    static let errorMessage403 = "No or an invalid amount has been specified."
    static let errorMessage501 = "No or an invalid timeframe has been specified."
    static let errorMessage502 = "No or an invalid start_date has been specified."
    static let errorMessage503 = "No or an invalid end_date has been specified."
    static let errorMessage504 = "An invalid timeframe has been specified."
    static let errorMessage505 = "The specified timeframe is too long, exceeding 365 days."

}

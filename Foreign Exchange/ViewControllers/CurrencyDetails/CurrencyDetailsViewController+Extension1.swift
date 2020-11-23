
import UIKit

extension CurrencyDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIConstants.currencyDetailsCellIdentifier) as! CurrencyDetailsTableViewCell
         let currency = currencies[indexPath.row]
        
        if let currencyRate = currencyDetails?.rates?[currency.currency] {
                let currencyViewModel = CurrencyDetailsViewModel(currency: currency, conversionRate: currencyRate, amount: currencyAmount)
            cell.setupCurrencyDetailsCell(currencyViewModel)

        }
        
        return cell
    }
    
}

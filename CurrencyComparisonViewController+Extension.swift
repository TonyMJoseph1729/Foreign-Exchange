
import UIKit

extension CurrencyComparisonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comparisonDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIConstants.currencyComparisonCellIdentifier) as! CurrencyComparisonTableViewCell
        let currencyDetails = comparisonDetails[indexPath.row]
        guard let currency1 = comparingCurrencies.first?.currency, let currency2 = comparingCurrencies.last?.currency else {
            return cell
        }
        if let currency1Value = currencyDetails.rates?[currency1], let currency2Value = currencyDetails.rates?[currency2] {
            guard let date = currencyDetails.date else {
                return cell
            }
            let currencyComparisonViewModel = CurrencyComparisonViewModel(date: date, currency1: currency1Value, currency2: currency2Value, amount: amount)
            cell.setupCurrencyComparisonTableViewCell(currencyComparisonViewModel: currencyComparisonViewModel)
        }
        return cell
    }

}

extension CurrencyComparisonViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}


import UIKit

class CurrencyComparisonTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currency1Label: UILabel!
    @IBOutlet weak var currency2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func convertDateString(dateString : String!, fromFormat sourceFormat : String!, toFormat desFormat : String!) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = sourceFormat
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = desFormat
        return dateFormatter.string(from: date!)
    }
    
    
    func setupCurrencyComparisonTableViewCell(currencyComparisonViewModel: CurrencyComparisonViewModel) {
        self.dateLabel.text = convertDateString(dateString: currencyComparisonViewModel.date, fromFormat: "yyyy-MM-dd", toFormat: "dd MMM yyyy")
        self.currency1Label.text = currencyComparisonViewModel.currency1Rate
        self.currency2Label.text = currencyComparisonViewModel.currency2Rate
    }
}

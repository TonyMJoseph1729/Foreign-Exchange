
import UIKit

class CurrencyDetailsTableViewCell: UITableViewCell {
    
    // symbol Images Dictionary
    let currencyImages = [CurrencyConstants.usd: #imageLiteral(resourceName: "USD"), CurrencyConstants.aud: #imageLiteral(resourceName: "AUD"),CurrencyConstants.jpy:#imageLiteral(resourceName: "JPY"),CurrencyConstants.gbp:#imageLiteral(resourceName: "GBP"),CurrencyConstants.chf:#imageLiteral(resourceName: "CHF"),CurrencyConstants.cad:#imageLiteral(resourceName: "CAD"),CurrencyConstants.sek:#imageLiteral(resourceName: "SEK"),CurrencyConstants.cny:#imageLiteral(resourceName: "CNY"),CurrencyConstants.nzd:#imageLiteral(resourceName: "NZD")]
    
    @IBOutlet weak var currencySelectionImage: UIImageView!
    @IBOutlet weak var currencySymbolImageView: UIImageView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var conversionRateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //setting up the currency details tableview cell
    func setupCurrencyDetailsCell(_ currencyDetailsViewModel: CurrencyDetailsViewModel) {
        
        self.currencyLabel.text = currencyDetailsViewModel.currency
        self.conversionRateLabel.text = currencyDetailsViewModel.convertedAmount
        self.currencySymbolImageView.image = currencyImages[currencyDetailsViewModel.currency!]
        
        //when a currency is selected for comparison
        if currencyDetailsViewModel.isSelected {
            self.currencySelectionImage.image = #imageLiteral(resourceName: "selectedImage")
            
        } else {
            self.currencySelectionImage.image = #imageLiteral(resourceName: "unselectedImage")
        }
        
    }
    
}

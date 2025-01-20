module EACurrencyConverter
  class Converter
    # Hardcoded exchange rates relative to USD
    EXCHANGE_RATES = {
      'USD' => 1.0,      # US Dollar
      'KES' => 115.0,    # Kenyan Shilling
      'UGX' => 3700.0,   # Ugandan Shilling
      'TZS' => 2300.0,   # Tanzanian Shilling
      'RWF' => 1150.0,   # Rwandan Franc
      'BIF' => 2100.0    # Burundian Franc
    }.freeze

    # Converts an amount from one currency to another
    def self.convert(amount, from_currency, to_currency)
      from_rate = EXCHANGE_RATES[from_currency]
      to_rate = EXCHANGE_RATES[to_currency]

      raise ArgumentError, "Unsupported currency: #{from_currency}" unless from_rate
      raise ArgumentError, "Unsupported currency: #{to_currency}" unless to_rate

      # Convert to USD first, then to the target currency
      usd_amount = amount / from_rate
      (usd_amount * to_rate).round(2)
    end
  end
end

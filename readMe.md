## Installation
> bundle add ea_currency_converter

## Usage
require_relative 'lib/ea_currency_converter'

# Convert 100 USD to KES
puts EACurrencyConverter::Converter.convert(100, 'USD', 'KES') 
# => 11500.0

# Convert 1000 UGX to TZS
puts EACurrencyConverter::Converter.convert(1000, 'UGX', 'TZS') 
# => 0.62

# Convert 5000 KES to USD
puts EACurrencyConverter::Converter.convert(5000, 'KES', 'USD') 
# => 43.48

# Convert within the same currency
puts EACurrencyConverter::Converter.convert(100, 'RWF', 'RWF') 
# => 100.0

# Invalid currency example
begin
  puts EACurrencyConverter::Converter.convert(100, 'XYZ', 'USD')
rescue ArgumentError => e
  puts e.message
  # => Unsupported currency: XYZ
end


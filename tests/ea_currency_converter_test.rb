require 'minitest/autorun'
require_relative '../lib/ea_currency_converter'

class EACurrencyConverterTest < Minitest::Test
  def test_convert_usd_to_kes
    assert_in_delta 11500.0, EACurrencyConverter::Converter.convert(100, 'USD', 'KES'), 0.01
  end

  def test_convert_kes_to_usd
    assert_in_delta 0.87, EACurrencyConverter::Converter.convert(100, 'KES', 'USD'), 0.01
  end

  def test_convert_ugx_to_tzs
    assert_in_delta 2300.0, EACurrencyConverter::Converter.convert(3700, 'UGX', 'TZS'), 0.01
  end

  def test_invalid_from_currency
    assert_raises(ArgumentError) { EACurrencyConverter::Converter.convert(100, 'XYZ', 'USD') }
  end

  def test_invalid_to_currency
    assert_raises(ArgumentError) { EACurrencyConverter::Converter.convert(100, 'USD', 'ABC') }
  end

  def test_same_currency_conversion
    assert_in_delta 100.0, EACurrencyConverter::Converter.convert(100, 'USD', 'USD'), 0.01
  end
end
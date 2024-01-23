# Description
Provides tools to fetch prices on coinpaprika API.

# API

# get_rate_conversion

### Signature
```cpp
std::string get_rate_conversion(const std::string& fiat, const std::string& ticker, std::error_code& ec) const noexcept;
```

### Description
Returns the price in the given fiat of the given ticker as an std::string.

### Example
```cpp
std::error_code ec;
current_price = paprika.get_rate_conversion("USD", "BTC", ec);
```

# get_ticker_infos

### Signature
```cpp
t_ticker_info_answer get_ticker_infos(const std::string& ticker) const noexcept;
```

# get_ticker_historical

### Signature
```cpp
t_ticker_historical_answer get_ticker_historical(const std::string& ticker) const noexcept;
```
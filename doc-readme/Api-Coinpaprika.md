# Functions

## async_price_converter

### Signature

```cpp
pplx::task<web::http::http_response> async_price_converter(const price_converter_request& request);
```

Take a request **const price_converter_request& request** and return a asynchronous task.

### Usage

```cpp
 const price_converter_request request{.base_currency_id = "BTC", .quote_currency_id = "USD"};
 async_price_converter(request)
            .then([](web::http::http_response resp) {
                 //! Handle Answer here
             }).then(&handle_exception_pplx_task);
```

## async_ticker_info

### Signature

```cpp
pplx::task<web::http::http_response> async_ticker_info(const ticker_infos_request& request);
```

Take a request **const ticker_infos_request& request** and return a asynchronous task.

### Usage

```cpp
auto answer_functor = [](web::http::http_response resp) { /* Handle answer here */ };
const ticker_infos_request request{.ticker_currency_id = "btc-bitcoin", .ticker_quotes = {"USD", "EUR", "BTC"}}; 
async_ticker_info(request).then(answer_functor).then(&handle_exception_pplx_task);
```
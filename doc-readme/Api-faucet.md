# Functions

## claim

### Signature

```cpp
pplx::task<web::http::http_response>
claim(const claim_request& claim_request);
```

### Description

Requests the faucet API to get test coins like RICK or MORTY. A task containing a http_response is returned. It takes a [claim_request](#claim_request) object as first parameter.

## get_claim_result

### Signature

```cpp
[[nodiscard]]
claim_result get_claim_result(const web::http::http_response& claim_response);
```

### Description

Returns a valid [claim_result](#claim_result) object corresponding to the response returned by the [claim](#claim) function.

# Structures

## claim_request

```cpp
std::string coin_name      // Name of the test coin used for faucet claiming (e.g. "RICK")
std::string wallet_address // Address of the chosen test coin wallet
```

## claim_result

```cpp
std::string message; // The message returned by the claim request.
std::string status;  // The status returned by the claim request.
```

# Examples

## Claim faucet and get request result
```cpp
faucet::api::claim_request claim_request {.coin_name      = coin_info.ticker,
                                          .wallet_address = mm2_system.address(ticker, ec)};
faucet::api::claim(claim_request)
    .then([this](web::http::http_response resp) {
        auto claim_result = faucet::api::get_claim_result(resp);
        
        spdlog::info("Faucet result is: \"{}\"", claim_result.message);
    });
```
# Description

This service verifies that your IP and country are allowed to use the application.

# API

# is_my_ip_authorized

### Signature
```cpp 
[[nodiscard]] bool is_my_ip_authorized() const noexcept;
```

### Description
Returns true if your public IP authorized by the application, false otherwise.

# my_country_ip

### Signature
```cpp
[[nodiscard]] QString my_country_ip() const noexcept;
```

### Description
Returns as a QString your country id (e.g. FR for France)
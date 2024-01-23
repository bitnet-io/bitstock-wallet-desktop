# Description

This services checks if a new version of the API is available. If yes, it will tell the frontend to display a popup where you can download the new version.

# Functional scheme

![](https://i.ibb.co/7NbbX88/update-checker-service.png)

# get_update_status (backend)

### Signature
```cpp
[[nodiscard]] nlohmann::json get_update_status() const noexcept;
```

### Description
Makes an HTTP request to the API endpoint to get version data.

If request succeeded, returns a JSON object with the following structure:
```cpp
rpc_code: unsigned short
current_version: char*
update_needed: bool
```
In case of failure, returns a JSON object with the following structure:
```cpp
status: std::string
```

# update_status (frontend)

### Description
Corresponds to the JSON object returned by [get_update_status()](#get_update_status-backend) function

### Example
```qml
readonly property bool status_good: API.app.update_status.rpc_code === 200
```


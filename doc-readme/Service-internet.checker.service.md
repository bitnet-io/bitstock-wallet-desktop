# Description

This service checks if your internet connection is still valid. If not it notifies the frontend and shows an error popup where you can try to reconnect.

# Functional scheme

![](https://i.ibb.co/jfHk5JX/internet-check-service.png)

# API

# internet_reacheable (frontend)

### Signature
```cpp
bool internet_reacheable;
```

### Description
This member tells if the internet status is valid.

### Example
```qml
Rectangle {
    id: app
    visible: !API.app.internet_checker.internet_reacheable
}
```


# retry (backend and frontend)

### Signature
```cpp
Q_INVOKABLE void retry() noexcept;
```

### Description
This function can be called from the frontend. It attemps to check if the connexion status is valid or not. If it succeeds, it sets `is_internet_alive` *Q_PROPERTY* to true. Otherwise it sets the property to false.

### Example
```qml
DefaultButton {
    text: qsTr("Retry")
    onClicked: API.app.internet_checker.retry()
    Layout.alignment: Qt.AlignHCenter
}
```
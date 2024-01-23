# What is a service ?

Every service is an ECS system: they are refreshed every frame. Therefore it can be used to continually fetch data or process logic. Moreover, services can provide a set of utilities in order to help the developer.

# Functional scheme
![](https://i.ibb.co/pdHndZ8/Module-Servicesv2.png)

# List of current services

| Service name | Description |
| ------------ | ----------- |
| [mm2.service](Service-mm2.service) | Allows you to communicate with the mm2 api. Stores coins informations and updates current balance |
| [ip.checker.service](Service-ip.checker.service) | Tells if your IP and country are authorized |
| [internet.checker.service](Service-internet.checker.service) | Checks your internet status |
| [ohlc.provider](Service-ohlc.provider) | Updates OHLC status |
| [global.provider](Service-global.provider) | Fetches coins prices by using band.provider or coinpaprika.provider services |
| [band.provider](Service-band.provider) | Uses Band protocol to fetch coin prices in fiat (not available for every coin) |
| [coinpaprika.provider](Service-coinpaprika.provider) | Uses coinpaprika to fetch coin prices in fiat |
| [update.checker.service](Service-update.checker.service) | Checks if a new version of the Atomicdex API is available |
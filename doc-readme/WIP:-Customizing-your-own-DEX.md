It is possible to customize your DEX application. By customizing we mean changing: DEX application name, publisher name, publisher website, application logo, and having your own visual themes...

## Changing names

### With environment

It's possible to configure names by setting few environment variables. Here is the variables set:

- `DEX_PROJECT_NAME` : contains the project name but also the name used by CMake to create the targets
- `DEX_DISPLAY_NAME` : contains the name that will be displayed when running the application
- `DEX_COMPANY` : contains the publisher's name
- `DEX_WEBSITE` : contains the publisher's website

### With CMake

It's also possible to configure names by modifying `project.metadata.cmake` in `cmake` folder. [Go check it out.](https://github.com/KomodoPlatform/atomicDEX-Desktop/blob/dev/cmake/project.metadata.cmake#L2)

## Changing application icon

Here are the files you need to edit to change your application icon on every supported OS:

- [dex-logo-64.png](https://github.com/KomodoPlatform/atomicDEX-Desktop/blob/dev/assets/logo/dex-logo-64.png) (Linux)
- [dex-logo.png](https://github.com/KomodoPlatform/atomicDEX-Desktop/blob/dev/assets/logo/dex-logo.png) (Linux)
- [dex-logo.icns](https://github.com/KomodoPlatform/atomicDEX-Desktop/blob/dev/assets/logo/dex-logo.icns) (MacOS)
- [dex-logo.ico](https://github.com/KomodoPlatform/atomicDEX-Desktop/blob/dev/assets/logo/dex-logo.ico) (Windows)
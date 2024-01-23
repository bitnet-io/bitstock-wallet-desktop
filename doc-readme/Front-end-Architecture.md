:construction: Under construction

# Flow Structure

![UI Structure](https://i.imgur.com/CzaqUvt.png)

# File Structure

## main.qml

It's starting point of the application. It has the `ApplicationWindow`. Inside, we have `App`.

## App.qml

App has everything about the application in it. There is a `StackLayout` which decides which page will be shown.

This `StackLayout` switches between:
* `FirstLaunch` - First page, can select a wallet to `Login`, or go to `NewUser`/`RecoverSeed` 
* `NewUser` -  New wallet creation page
* `RecoverSeed` - Restore a wallet from an existing seed
* `Login` - Login to an existing wallet
* `InitialLoading` - Loading screen during the backend login is happening
* `Dashboard` - Rest of the application.

All these views are in the `Screens` folder.

## Screens/Dashboard.qml

This component has the rest of the application, other than the login and wallet creation parts. There is another `StackLayout` which decides which page will be shown.

This `StackLayout` switches between:
* `Portfolio` - First page after login, shows the list of enabled coins
* `Wallet` - Has a specific page for every coin, with the list of enabled coins at side
* `AddressBook` - Has the list of contacts, with their coin specific addresses
* `Exchange` - Everything about trades, has 3 tabs: `Trade`, `Orders`, `History`
* `Settings` - Configurations, wallet deletion, logout stuff
* `Support` - Update information, FAQ section and links to the websites

## Constants Folder

This folder has the singleton components.

## Constants/API.qml

This component is the bridge between the front-end and back-end. Every other file can reach to the backend using `API.app.something()`.

## Constants/General.qml

This component has all the helper and utility functions, logic related constants, file paths etc. Every other file can reach to these like `General.image_path`.

## Constants/Style.qml

This component has all the colors and UI constants like text sizes, margins and spacing. Every other file can reach to these like `Style.colorGreen`.

## Components Folder

This folder has many components in it. These are mostly the reusable components, for styling. Like `DefaultTextField.qml` is a modified `TextField` component which is stylized for the application, also has more features added. Same folder also has `AddressField.qml`, which is a modified `DefaultTextField`. These components can be used anywhere.

## Dashboard Folder

This folder has the components which are used in all pages. For example, `NotificationsModal`, which is a popup, can be opened at any page, from the sidebar. Currently, inside the app, first page tab is called `Dashboard`, which is confusing because it got renamed from `Portfolio`. So the file for that page is `Portfolio.qml`. The code-base `Dashboard` encapsulates all the pages: `Portfolio`, `Wallet`, `Exchange`, etc. 


## Exchange Folder

Exchange section has 3 tabs: `Trade`, `Orders`, `History`. There is a folder for each one of them. Exchange folder has the components which are used in those 3 pages. Page specific components are inside the page folders.

## Portfolio, Wallet, Settings, Support Folders

All these folders are the tabs in the application. The main file like `Wallet.qml` and things used in those pages are in those folders.

## Sidebar Folder

Sidebar is not a page, it's visible at all pages. `Sidebar.qml` and the sidebar components are inside.
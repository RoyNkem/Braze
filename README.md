
# Braze 

A Crypto Currency App created using `SwiftUI` with `MVVM` architecture.
Braze tracks live prices of crypto coins and can create mock portfolio.

Using `Combine` framework with `Subscribers/Publishers` for efficient Data loading and
`CoreData` for Local Data Persistance.

## Show some :heart: and star the repo to support the project.

## Note
This repository is still in development and I will continue to add more features to it.

## Features :camera_flash:
* CoreData
* Combine Framework 
* Light/dark mode 
* Live prices
* User Portfolio 
* iphone and ipad support
* MVVM architecture
* Search Features
* Details of Coins 

# Built with :heavy_heart_exclamation: using 

<a href="https://developer.apple.com/xcode/" target="_blank"> <img src="https://img.shields.io/badge/Xcode-1882e8?style=for-the-badge&logo=Xcode&logoColor=white" alt="Xcode"/> </a> 
<a href="https://www.coingecko.com/en/api" target="_blank"> <img src="https://img.shields.io/badge/coingecko api-AAFF00?style=for-the-badge&logo=Bitcoin&logoColor=white" alt="coingecko"/> </a>
<a href="https://stackoverflow.com" target="_blank"> <img src="https://img.shields.io/badge/stackoverflow-f58023?style=for-the-badge&logo=stackoverflow&logoColor=white" alt="stackoverflow"/> </a>
<a href="https://github.com/" target="_blank"> <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/> 
<a href="https://youtube.com" target="_blank"> <img src="https://img.shields.io/badge/youtube-ff0000?style=for-the-badge&logo=youtube&logoColor=white" alt="youtube"/> </a>
<a href="https://developer.apple.com/swift/" target="_blank"> <img src="https://img.shields.io/badge/Swift-f15139?style=for-the-badge&logo=Swift&logoColor=white" alt="Swift"/> </a>  


## ScreenShots

<p>
<img src="https://user-images.githubusercontent.com/95645767/194495367-f8b2df87-9838-4d88-8948-709a165671c3.png" alt="Home View Dark" width = "240" />
<img src="https://user-images.githubusercontent.com/95645767/194495474-9053824d-fb1b-4b0f-a497-b1f04c182208.png" alt="Home View Light" width = "241"/>
  
</p>
  
## API Reference

#### Get all coins

```http
  GET https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `vs_currency` | `string` | **Required**. currency format |
| `order` | `string` | valid values: market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc |
| `per_page` | `integer` |  Total results per page |
| `page` | `integer` | Page through results |
| `sparkline` | `boolean` | Include sparkline 7 days data (eg. true, false)
| `price_change_percentage` | `string` | Include price change percentage in 1h, 24h, 7d, 14d, 30d, 200d, 1y |

 

#### Get details for coins

```http
  GET /coins/{id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. pass the coin id (can be obtained from /coins) eg. bitcoin |




## Language

 Swift - 100%


<p align="right">(<a href="#top">back to top</a>)</p>



# Braze 

A Crypto Currency App created using `SwiftUI` with `MVVM` architecture.
Braze tracks live prices of crypto coins and can create mock portfolio.

Using `Combine` framework with `Subscribers/Publishers` for efficient Data loading and
`CoreData` for Local Data Persistance.

## Show some :heart: and star the repo to support the project.

## Note
This repository is still in development and I will continue to add more features to it.


## Features :camera_flash:
- [ ] CoreData
- [x] Combine Framework 
- [x] Light/dark mode 
- [x] Live prices
- [ ] User Portfolio 
- [ ] iphone and ipad support
- [x] MVVM architecture
- [x] Search Features
- [ ] Details of Coins 

# Built with :heavy_heart_exclamation: using 

<a href="https://developer.apple.com/xcode/" target="_blank"> <img src="https://img.shields.io/badge/Xcode-1882e8?style=for-the-badge&logo=Xcode&logoColor=white" alt="Xcode"/> </a> 
<a href="https://www.coingecko.com/en/api" target="_blank"> <img src="https://img.shields.io/badge/coingecko api-AAFF00?style=for-the-badge&logo=Bitcoin&logoColor=white" alt="coingecko"/> </a>
<a href="https://stackoverflow.com" target="_blank"> <img src="https://img.shields.io/badge/stackoverflow-f58023?style=for-the-badge&logo=stackoverflow&logoColor=white" alt="stackoverflow"/> </a>
<a href="https://github.com/" target="_blank"> <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/> 
<a href="https://youtube.com" target="_blank"> <img src="https://img.shields.io/badge/youtube-ff0000?style=for-the-badge&logo=youtube&logoColor=white" alt="youtube"/> </a>
<a href="https://developer.apple.com/swift/" target="_blank"> <img src="https://img.shields.io/badge/Swift-f15139?style=for-the-badge&logo=Swift&logoColor=white" alt="Swift"/> </a>  


## ScreenShots

<p>
<img src="https://user-images.githubusercontent.com/95645767/194769322-8fc6dae1-8716-4d57-ac74-0b162870e629.png" alt="Home View Dark" width = "240" />
<img src="https://user-images.githubusercontent.com/95645767/194769300-ab05a313-7765-4d4a-9d13-63a87a570991.png" alt="Home View Dark" width = "241"/>
<img src="https://user-images.githubusercontent.com/95645767/194769305-5b518942-df7b-42e7-b073-38b7411242d5.png" alt="Portfolio View Light" width = "240"/>
<img src="https://user-images.githubusercontent.com/95645767/194769737-24bdef62-4de3-4f1a-9351-0032062186bf.png" alt="Portfolio View Dark" width = "241"/>
<img src="https://user-images.githubusercontent.com/95645767/194769734-39590124-d265-451a-8324-31acf248bfdb.png" alt="Search View Light" width = "240"/>
<img src="https://user-images.githubusercontent.com/95645767/194769295-ca3715aa-5676-4c2e-81c3-1ce5ca4fbb99.png" alt="Search View Dark" width = "241"/>
 </p>
 
 <p align="right">(<a href="#top">back to top</a>)</p>

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


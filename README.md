
# Braze <img src="https://user-images.githubusercontent.com/95645767/197086805-88b33a07-54e6-42ec-8ea8-2782de4db61d.jpg" width="35" height="35" />

A Crypto Currency App created using `SwiftUI` with `MVVM` architecture.
Braze tracks live prices of crypto coins and can create mock portfolio.

Using `Combine` framework with `Subscribers/Publishers` for efficient Data loading and
`CoreData` for Local Data Persistance.

## Show some :heart: and star the repo to support the project.

## Note
This repository is still in development and I will continue to add more features to it.


## Features :camera_flash:
- [x] CoreData
- [x] Combine Framework 
- [x] Light/dark mode 
- [x] Live prices
- [x] User Portfolio 
- [ ] iphone and ipad support
- [x] MVVM architecture
- [x] Search Features
- [ ] Details of Coins 
- [ ] Coin Price History


# Built with :heavy_heart_exclamation: using 

<a href="https://developer.apple.com/xcode/" target="_blank"> <img src="https://img.shields.io/badge/Xcode-1882e8?style=for-the-badge&logo=Xcode&logoColor=white" alt="Xcode"/> </a> 
<a href="https://www.coingecko.com/en/api" target="_blank"> <img src="https://img.shields.io/badge/coingecko api-AAFF00?style=for-the-badge&logo=Bitcoin&logoColor=white" alt="coingecko"/> </a>
<a href="https://stackoverflow.com" target="_blank"> <img src="https://img.shields.io/badge/stackoverflow-f58023?style=for-the-badge&logo=stackoverflow&logoColor=white" alt="stackoverflow"/> </a>
<a href="https://github.com/" target="_blank"> <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/> 
<a href="https://youtube.com" target="_blank"> <img src="https://img.shields.io/badge/youtube-ff0000?style=for-the-badge&logo=youtube&logoColor=white" alt="youtube"/> </a>
<a href="https://developer.apple.com/swift/" target="_blank"> <img src="https://img.shields.io/badge/Swift-f15139?style=for-the-badge&logo=Swift&logoColor=white" alt="Swift"/> </a>  


## ScreenShots

<p>
<img src="https://user-images.githubusercontent.com/95645767/197089523-c92d7ac3-32ab-4c67-8386-d1cd2943fa46.png" alt="Home View Dark" width = "220" />
<img src="https://user-images.githubusercontent.com/95645767/197089527-002480a4-949b-483e-93e4-a16f34649309.png" alt="Home View Dark" width = "220.5"/>
<img src="https://user-images.githubusercontent.com/95645767/197089745-f7dcfcd3-1025-44f7-9a38-68a7d5c1887a.png" alt="Portfolio View Light" width = "220"/>
<img src="https://user-images.githubusercontent.com/95645767/197089759-b643e3e6-8213-4b6b-ac1f-291ee44744a5.png" alt="Portfolio View Dark" width = "220.5"/>
<img src="https://user-images.githubusercontent.com/95645767/197090055-c04ff549-93fd-41a0-9277-4d801aa50289.png" alt="Search View Light" width = "220"/>
<img src="https://user-images.githubusercontent.com/95645767/197090065-d6ff88b7-d930-4927-88b0-b02a4439eb4e.png" alt="Search View Dark" width = "220.5"/>

<img src="https://user-images.githubusercontent.com/95645767/197090120-160bebde-d7f0-439e-b49d-bc8247e03325.png" alt="Search View Light" width = "220"/>
<img src="https://user-images.githubusercontent.com/95645767/197090129-c436cfd9-e38f-403f-8ac6-b84bd26ffd81.png" alt="Search View Light" width = "220"/>

<img src="https://user-images.githubusercontent.com/95645767/197090076-78753467-ce53-47a1-beb1-d7ce2f1c2592.png" alt="Search View Light" width = "220"/>
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


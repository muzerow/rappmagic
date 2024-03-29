# rappmagic <img src='https://raw.githubusercontent.com/muzerow/rappmagic/master/inst/rappmagic.png' align="right" height="139" /></a>
A Wrapper for AppMagic API

# Installation

```r
remotes::install_github("muzerow/rappmagic")
```

# Available functions

## General

* `am_auth()` - Get AppMagic API Authentication token
* `am_categories()` - Get AppMagic Categories
* `am_tags()` - Get AppMagic Tags

## Applications

* `am_apps()` - Get Applications by Search Query
* `am_apps_ids()` - Get Applications Info by Store Application IDs
* `am_app()` - Get Application by Store Application ID
* `am_app_info()` - Get Application Info by Store Application ID
* `am_app_release_notes()` - Get Application Release Notes by Store Application ID
* `am_app_screenshots()` - Get Application Screenshots by Store Application ID
* `am_app_similarity()` - Get Application Similarity by Store Application ID

## United Applications

* `am_united_apps()` - Get United Applications by Search Query
* `am_united_apps_app_ids()` - Get United Applications Info by Store Application IDs
* `am_united_apps_ids()` - Get United Applications Info by United Applications IDs
* `am_united_app()` - Get United Application by United Application ID
* `am_united_app_ltv()` - Get United Application LTV by United Application ID

## History

* `am_history_apps()` - Get Data for Application
* `am_history_united_app()` - Get Data for United Application

## Tops

* `am_advanced_search()` - Get Advanced Search
* `am_top_apps()` - Get Top Applications
* `am_top_ltv()` - Get Top LTV
* `am_top_publishers()` - Get Top Publishers
* `am_top_soft_launches()` - Get Top Soft Launches
* `am_top_trending()` - Get Top Trending Applications
* `am_top_united_apps()` - Get Top United Applications

## Publishers

* `am_publishers()` - Get Publishers by Search Query
* `am_publisher()` - Get Publisher by Store Publisher ID
* `am_publisher_apps()` - Get Publisher Applications by Store Publisher ID

## United Publishers

* `am_united_publisher()` - Get Data for United Publisher
* `am_united_publishers()` - Search for United Publishers
* `am_united_publishers_ids()` - Get United Publishers Info by United Publishers IDs
* `am_united_publisher_united_apps()` - Get United Applications for United Publisher

## Ad Intelligence

* `am_apps_ads()` - Get Application Ads

## Contacts

* `am_contacts_companies()` - Get LinkedIn Companies from United Publisher ID
* `am_contacts_profiles()` - Get Profiles from Company ID

## Technical

* `am_list_to_table()` - Transform list into table

### Author

Kirill Mukhin, Data Analyst at [Geeky House](https://geeky.house/)


# %%
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.common.by import By

from bs4 import BeautifulSoup

import pandas as pd
import googlemaps
import sqlite3

os.chdir("/Users/kefo395/coding/thro-de/02-Web-Scraping-and-APIs")


# %%
driver = webdriver.Chrome()

gmaps = googlemaps.Client(key='xxx')

def get_parsed_data(url: str, wait_condition: str):
    driver.get(url)
    
    # https://scrapfly.io/blog/how-to-wait-for-page-to-load-in-selenium/
    _timeout = 10  # ⚠ don't forget to set a reasonable timeout
    WebDriverWait(driver, _timeout).until(
        expected_conditions.presence_of_element_located(
            # we can wait by any selector type like element id:
            # (By.ID, "operations-tag-Auth")
            # or by class name
            (By.CLASS_NAME, wait_condition)
            # or by xpath
            # (By.XPATH, "//h1[@class='price']")
            # or by CSS selector
            # (By.CSS_SELECTOR, "h1.price")
        )
    )

    # time.sleep(5)

    html = driver.execute_script("return document.getElementsByTagName('html')[0].innerHTML")
    soup = BeautifulSoup(html, "html.parser")

    return soup


# %%
url = "https://www.mcdonalds.com/de/de-de/restaurant-suche.html"
search_class = "ubsf_sitemap-group-link"

soup_restaurants = get_parsed_data(url, search_class)

location_links = soup_restaurants.find_all('a', class_=search_class)
location_urls = [link['href'] for link in location_links]


# %%
address_list = []
search_class = "ubsf_sitemap-location-address"

# for x in range(2):
for x in range(len(location_urls)):
  soup_location = get_parsed_data(location_urls[x], search_class)
  location_address_html = soup_location.find_all('div', class_=search_class)
  location_address = [loc_address_html.text for loc_address_html in location_address_html]
  address_list = address_list + location_address

address_df = pd.DataFrame(address_list, columns =['mc_address'])
address_df[['Strasse', 'Ort', 'Land']] = address_df['mc_address'].str.split(',',expand=True)


# %%
# for x in range(1):
for x in range(len(address_df)):
    geocode_result = gmaps.geocode(address_df['mc_address'][x])
    address_df.at[x, 'lat'] = geocode_result[0]["geometry"]["location"]["lat"]
    address_df.at[x, 'lng'] = geocode_result[0]["geometry"]["location"]["lng"]


# %%
con = sqlite3.connect("mc_donalds.db")
address_df.to_sql(name='mc_donalds', con=con)
con.close()


# %%
driver.quit()


# %%
url = "https://www.mcdonalds.com/de/de-de/restaurant-suche.html/l/regensburg"
search_class = "ubsf_sitemap-location-address"

address_list = []
soup_location = get_parsed_data(url, search_class)
location_address_html = soup_location.find_all('div', class_=search_class)
location_address = [loc_address_html.text for loc_address_html in location_address_html]
address_list = address_list + location_address

address_df = pd.DataFrame(address_list, columns =['mc_address'])
address_df[['Strasse', 'Ort', 'Land']] = address_df['mc_address'].str.split(',',expand=True)

for x in range(len(address_df)):
    geocode_result = gmaps.geocode(address_df['mc_address'][x])
    address_df.at[x, 'lat'] = geocode_result[0]["geometry"]["location"]["lat"]
    address_df.at[x, 'lng'] = geocode_result[0]["geometry"]["location"]["lng"]

address_df.to_csv("mc_donalds.csv", index=False, sep=';', decimal=',')

driver.quit()


# %%

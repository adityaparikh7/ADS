#count the number of tweets by a given Twitter account using Selenium and Beautiful Soup

# from selenium import webdriver
# from bs4 import BeautifulSoup

# # Create a new instance of the Chrome web driver
# driver = webdriver.Chrome('C:\Program Files\Google\Chrome\Application\chrome.exe')

# # Screen name of the user whose tweets you want to count
# screen_name = "NikkiLavda"

# # Navigate to the Twitter account page
# driver.get('https://twitter.com/' + screen_name)

# # Wait for the page to load
# driver.implicitly_wait(10)

# # Extract the HTML content of the page
# html = driver.page_source

# # Parse the HTML content using Beautiful Soup
# soup = BeautifulSoup(html, 'html.parser')

# # Find all tweet elements
# tweets = soup.find_all('div', class_='tweet')

# # Count the number of tweets
# num_tweets = len(tweets)

# # Print the number of tweets
# print("Number of tweets by", screen_name, ":", num_tweets)

# # Close the web driver
# driver.quit()

#----------------------------------------------------------------------------------------------------------------


#count the number of tweets by a given Twitter account using Beautiful Soup and Pandas

# import pandas as pd
# from bs4 import BeautifulSoup

# # Screen name of the user whose tweets you want to count
# screen_name = "NikkiLavda"

# # URL of the Twitter account page
# url = 'https://twitter.com/' + screen_name

# # Read the HTML content of the page and extract the tweet elements
# tweets = pd.read_html(url, attrs={"class":"tweet"})

# # Count the number of tweets
# num_tweets = len(tweets[0])

# # Print the number of tweets
# print("Number of tweets by", screen_name, ":", num_tweets)


#--------------------------------------------------------------------------------------------

# import requests
# from bs4 import BeautifulSoup

# handle = "elonmusk"  # replace with the handle you want to scrape

# url = f"https://twitter.com/{handle}"
# response = requests.get(url)

# soup = BeautifulSoup(response.text, "html.parser")
# tweet_count = soup.find("a", {"href": f"/{handle}/tweets"}).find("span", {"class": "css-901oao css-16my406 r-poiln3 r-bcqeeo r-qvutc0"}).get_text()

# print(f"{handle} has {tweet_count} tweets")

#----------------------------------------------------------------------------------------------

# from bs4 import BeautifulSoup
# import requests

# handle = input('Input your account name on Twitter: ')
# temp = requests.get('https://twitter.com/'+handle)
# bs = BeautifulSoup(temp.text,'lxml')

# try:
#     tweet_box = bs.find('li',{'class':'ProfileNav-item ProfileNav-item--tweets is-active'})
#     tweets= tweet_box.find('a').find('span',{'class':'ProfileNav-value'})
#     print("{} tweets {} number of tweets.".format(handle,tweets.get('data-count')))

# except:
#     print('Account name not found...')

#----------------------------------------------------------------------------------------------

import requests
from bs4 import BeautifulSoup

handle = input('Input your account name on Twitter: ') # replace with the handle you want to scrape

url = f"https://twitter.com/{handle}"
response = requests.get(url)

if response.status_code != 200:
    print(f"Error: {response.status_code}")
    exit()

soup = BeautifulSoup(response.text, "html.parser")

a_elem = soup.find("a", {"href": f"/{handle}/tweets"})
if a_elem is None:
    print("Error: Could not find tweets link")
    exit()

span_elem = a_elem.find("span", {"class": "css-901oao css-16my406 r-poiln3 r-bcqeeo r-qvutc0"})
if span_elem is None:
    print("Error: Could not find tweet count")
    exit()

tweet_count = span_elem.get_text()

print(f"{handle} has {tweet_count} tweets")


#----------------------------------------------------------------------------------------------





# %%
import os

from bs4 import BeautifulSoup
import requests
import time
import datetime
import smtplib

os.chdir("/Users/kefo395/coding/thro-de/02-Web-Scraping-and-APIs")


# %%
# Connect to Website and pull in data
URL = 'https://www.amazon.com/Funny-Data-Systems-Business-Analyst/dp/B07FNW9FGJ/ref=sr_1_3?dchild=1&keywords=data%2Banalyst%2Btshirt&qid=1626655184&sr=8-3&customId=B0752XJYNL&th=1'

# Find Your User-Agent: https://httpbin.org/get

headers = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36", "Accept-Encoding":"gzip, deflate", "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT":"1","Connection":"close", "Upgrade-Insecure-Requests":"1"}

page = requests.get(URL, headers=headers)

soup1 = BeautifulSoup(page.content, "html.parser")
soup2 = BeautifulSoup(soup1.prettify(), "html.parser")

title = soup2.find(id='productTitle').get_text()
price = soup2.find(id='acrCustomerReviewText').get_text()

print(title)
print(price)


# %%
# Clean up the data a little bit
price = price.strip()[0:]
title = title.strip()

print(title)
print(price)


# %%
# Create a Timestamp for your output to track when data was collected
today = datetime.date.today()
print(today)


# %%
import csv 

header = ['Title', 'Price', 'Date']
data = [title, price, today]

with open('amazon.csv', 'w', newline='', encoding='UTF8') as f:
    writer = csv.writer(f)
    writer.writerow(header)
    writer.writerow(data)


# %%
import pandas as pd

df = pd.read_csv(r'amazon.csv')
print(df)


# %%
# Now we are appending data to the csv
with open('amazon.csv', 'a+', newline='', encoding='UTF8') as f:
    writer = csv.writer(f)
    writer.writerow(data)


# %%
# Combine all of the above code into one function
def check_price():
    URL = 'https://www.amazon.com/Funny-Data-Systems-Business-Analyst/dp/B07FNW9FGJ/ref=sr_1_3?dchild=1&keywords=data%2Banalyst%2Btshirt&qid=1626655184&sr=8-3&customId=B0752XJYNL&th=1'

    headers = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36", "Accept-Encoding":"gzip, deflate", "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT":"1","Connection":"close", "Upgrade-Insecure-Requests":"1"}

    page = requests.get(URL, headers=headers)

    soup1 = BeautifulSoup(page.content, "html.parser")
    soup2 = BeautifulSoup(soup1.prettify(), "html.parser")

    title = soup2.find(id='productTitle').get_text()
    price = soup2.find(id='acrCustomerReviewText').get_text()

    price = price.strip()[0:]
    title = title.strip()

    today = datetime.date.today()
    
    header = ['Title', 'Price', 'Date']
    data = [title, price, today]

    with open('amazon.csv', 'a+', newline='', encoding='UTF8') as f:
        writer = csv.writer(f)
        writer.writerow(data)

    # if(price<14):
    #     send_mail()

 

# %%
# Runs check_price after a set time and inputs data into your CSV

while(True):
    check_price()
    time.sleep(5)


# %%
df = pd.read_csv(r'amazon.csv')
print(df)


# %%
# If uou want to try sending yourself an email (just for fun) when a price hits below a certain level you can try it out with this script

def send_mail():
    server = smtplib.SMTP_SSL('smtp.gmail.com',465)
    server.ehlo()
    #server.starttls()
    server.ehlo()
    server.login('someone@gmail.com','xxxxxxxxxxxxxx')
    
    subject = "The Shirt you want is below $15! Now is your chance to buy!"
    body = "This is the moment we have been waiting for. Now is your chance to pick up the shirt of your dreams. Don't mess it up! Link here: https://www.amazon.com/Funny-Data-Systems-Business-Analyst/dp/B07FNW9FGJ/ref=sr_1_3?dchild=1&keywords=data+analyst+tshirt&qid=1626655184&sr=8-3"
   
    msg = f"Subject: {subject}\n\n{body}"
    
    server.sendmail(
        'someone@gmail.com',
        msg
     
    )
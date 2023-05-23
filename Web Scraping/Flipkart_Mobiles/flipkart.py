import pandas as pd 
import requests
from bs4 import BeautifulSoup

urls = [    "https://www.flipkart.com/search?q=redmi&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off&page=",    "https://www.flipkart.com/search?q=realme+mobile&sid=tyy%2C4io&as=on&as-show=on&otracker=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_ps&otracker1=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_ps&as-pos=1&as-type=RECENT&suggestionId=realme+mobile%7CMobiles&requestId=841cc91e-7650-41f4-ac36-bd49f543e6db&as-searchtext=realm&page=", "https://www.flipkart.com/search?q=apple+mobiles&sid=tyy%2C4io&as=on&as-show=on&otracker=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_ps&otracker1=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_ps&as-pos=1&as-type=RECENT&suggestionId=apple+mobiles%7CMobiles&requestId=f05eb407-5c06-4bf7-8a15-9484948fa6e8&as-searchtext=apple&page=", "https://www.flipkart.com/search?q=one+plus+mobile&sid=tyy%2C4io&as=on&as-show=on&otracker=AS_QueryStore_OrganicAutoSuggest_1_3_na_na_ps&otracker1=AS_QueryStore_OrganicAutoSuggest_1_3_na_na_ps&as-pos=1&as-type=RECENT&suggestionId=one+plus+mobile%7CMobiles&requestId=c8c4ca2d-31d4-4eb0-b607-8f939310eea5&as-searchtext=one&page=1", "https://www.flipkart.com/search?q=samsung+mobiles&sid=tyy%2C4io&as=on&as-show=on&otracker=AS_QueryStore_OrganicAutoSuggest_2_2_na_na_ps&otracker1=AS_QueryStore_OrganicAutoSuggest_2_2_na_na_ps&as-pos=2&as-type=RECENT&suggestionId=samsung+mobiles%7CMobiles&requestId=8e814780-d8b6-48e5-9136-24bba347017d&as-searchtext=sa&page=", "https://www.flipkart.com/search?q=motorola+mobiles&sid=tyy%2C4io&as=on&as-show=on&otracker=AS_QueryStore_OrganicAutoSuggest_2_9_na_na_ps&otracker1=AS_QueryStore_OrganicAutoSuggest_2_9_na_na_ps&as-pos=2&as-type=RECENT&suggestionId=motorola+mobiles%7CMobiles&requestId=c5f81e7e-fd0e-46df-adb6-4d9a047be512&as-searchtext=motorola+&page="]

Product_name=[]
Prices=[]
Description=[]
Reviews=[] 

for url in urls:
    for i in range(2,30):
        r=requests.get(url+str(i))
        soup= BeautifulSoup(r.text,"lxml")
        box=soup.find("div",class_="_1YokD2 _3Mn1Gg")

        names= box.find_all("div",class_="_4rR01T")

        for i in names:
            name=i.text
            Product_name.append(name)

        prices=box.find_all("div",class_="_30jeq3 _1_WHN1")

        for i in prices:
            name= i.text
            Prices.append(name)

        Desc = box.find_all("ul",class_="_1xgFaf")
        for i in Desc:
            name=i.text
            Description.append(name)

        reviews = box.find_all("div",class_="_3LWZlK")
        for i in reviews:
            name=i.text
            Reviews.append(name)

data = zip(Product_name, Prices, Description, Reviews)
df = pd.DataFrame(columns=["Product Name", "Prices", "Description", "Reviews"])

for row in data:
    if len(row) == 4:
        df = pd.concat([df, pd.DataFrame([row], columns=["Product Name", "Prices", "Description", "Reviews"])], ignore_index=True)

df.to_csv("C:/Users/TUSHAR UPADHYAY/Desktop/Python/web scraping/new_Mobiles1.csv", index=0)




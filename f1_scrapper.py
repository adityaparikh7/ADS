import requests
from bs4 import BeautifulSoup

#enter url below
url = "https://www.formula1.com/en/results.html/2021/races/1075/abu-dhabi/race-result.html"

page = requests.get(url)
soup = BeautifulSoup(page.content, "html.parser")

table = soup.find("table", class_="resultsarchive-table")
rows = table.find_all("tr")

for row in rows:
    cells = row.find_all("td")
    if cells:
        position = cells[1].text.strip()
        driver = cells[3].text.strip()
        team = cells[4].text.strip()
        lap_time = cells[7].text.strip()
        print(f"{position} {driver} ({team}): {lap_time}")
        

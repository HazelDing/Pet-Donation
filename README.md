# Pet-Donation
## Introduction
The project was to create a streamlined database system for a pet rescue charity, optimizing their donation collection and management processes. By devising a star schema and implementing SQL Server Management Studio, our team effectively mapped out donation patterns, analyzed critical metrics such as average donation amounts by various demographics, and provided valuable insights to facilitate more informed decision-making for the charity.

## Table Design
![image](https://github.com/HazelDing/petDonation/assets/149340952/39b58fa0-1509-40bc-a7eb-7419e5a7ec0e)
![image](https://github.com/HazelDing/petDonation/assets/149340952/4c243a77-b7b5-430b-8763-2d25920877ad)

## Data Modelling (Star Schema)
![image](https://github.com/HazelDing/petDonation/assets/149340952/ded0cf2d-62ed-4b61-bb6d-ab2c24049d27)

## Business Questions
### 1. The average and sum of the donation by day, month, and year.
![image](https://github.com/HazelDing/petDonation/assets/149340952/cd3d1400-be84-45df-adbb-56418f09e81e)
### Insights:
In 2023, the average donation was $101.8, with December alone accounting for $4848 in total donations. The subsequent year saw an average donation of $85.69, with January and February's contributions amounting to $1395 and $1180, respectively. Specific noteworthy days included the 11th, 12th, and 13th of December 2023, which brought in totals of $1548, $1030, and $2270. In the new year, the 25th and 26th of January yielded $825 and $570, while the 8th and 9th of February saw donations of $730 and $450, respectively.

### 2. The average and sum of the donations by postal code and city in a specific month on the condition of defining the city and month as variables to allow flexibility.
![image](https://github.com/HazelDing/petDonation/assets/149340952/d17b1480-560f-4f0d-b5db-d328f32d8729)
![image](https://github.com/HazelDing/petDonation/assets/149340952/9cb8b528-2fff-4ff4-bf2c-b7eb7215de46)
![image](https://github.com/HazelDing/petDonation/assets/149340952/4aefa7bb-d882-4b78-a9a7-a650dcd79c4a)
### Insights:
For the city of Oakville, throughout December 2023 in Oakville, a review of donation data by postal code reveals a range of average donations, with the highest average being $300.00 in the K4C 9K7 area, which also corresponds to the highest total donations received. In Etobicoke during December of 2023, donation activity exhibited a diverse range of giving, with average donation amounts varying significantly across different postal codes. The M8Z1C5 area stood out with the highest average donation of $250.00, which was also the total donation amount for that postal code, indicating perhaps a single generous contribution. On the other end of the spectrum, the M8Z1C8 area had the smallest average donation of $5.00.

### 3. The amount collected per payment method from the city with highest value ofdonations. Define the payment method as variable to allow flexibility.
![image](https://github.com/HazelDing/petDonation/assets/149340952/a94afbf3-ee8e-408d-8519-45860f1474e8)
### Insights:
In the analysis of highest values across various cities, we have identified the highest single donations made through different payment types. Brampton reported a top donation of $150.00 via cash and $90.00 through credit card transactions, with an additional $55.00 being the maximum amount donated via cheque. Etobicoke's charitable contributions peaked at $250.00 for cash, accompanied by significant credit card and cheque donations of $100.00 and $60.00, respectively. Mississauga's generosity displayed through a $200.00 cheque donation and $100.00 via credit card. Oakville presented a strong inclination towards credit card contributions with the highest donation reaching $300.00, along with $200.00 by cheque and a solid $70.00 in cash. Lastly, Toronto showcased the most substantial individual donations, leading with a $255.00 cheque and closely followed by a cash donation of $250.00. The highest credit card donation in Toronto was $120.00. These figures reflect the diverse giving patterns and the preferred payment methods in each city.








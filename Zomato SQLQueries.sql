select * from zomato;
select * from  country;
select * from currency;
select * from calender;

   #-----1.Total count of Restaurant
select COUNT(*) AS total_restaurants
from zomato;

#2...Total count of restaurant based on country
select  c.CountryName,COUNT(z.RestaurantID) AS total_restaurants
from  zomato z
join country c
on z.CountryCode = c.CountryID
group by c.CountryName
order by total_restaurants desc;

#3...Top 10 cities by with most restaurant
select City,COUNT(*) AS total_restaurants
from zomato
group by City
order by total_restaurants desc
limit 10;

#4...Average rating of Restaurant
select round(avg(Rating),2) as average_rating
from zomato;

#5.Restaurant Based on Online Delivery
select count(*) as online_delivery_restaurants
from zomato
where Has_Online_delivery = 'Yes';

#6.Top High Rated Restaurant
select RestaurantName,City,Rating
from zomato
order by Rating desc
limit 10;

#7..Number of Restaurants Opening by Year
select year(Datekey_Opening) as opening_year, count(*) as restaurants_opened
from zomato
group by  opening_year
order by opening_year;

#8...Bucket list by price 
select 
    case
        when  Average_Cost_for_two between 0 and 500 then 'Low'
        when Average_Cost_for_two between 501 and 2000 then 'Medium'
        when Average_Cost_for_two between 2001 and 5000 then 'High'
        else 'Luxury'
    end  as Price_Category, COUNT(*) as Total_Restaurants
	from zomato
 group by  Price_Category
order by Total_Restaurants DESC;

#9.... Find restaurants with rating greater than overall average rating
select  RestaurantName,City,rating
from zomato
where rating >(select avg(rating)from zomato)
order by rating desc;

#10...Find the busiest city based on total votes received by restaurants
select 
    City,SUM(Votes) as Total_Votes,COUNT(*) as Total_Restaurants
    from zomato
    group by City
    order by Total_Votes desc
    limit 1;
Create Database Ola;
Use Ola;
show tables;


-- 1. Retrieve all successful bookings:
Create view Successful_Bookings as
Select * from bookings
where Booking_Status = "Success";

#1. Retriving all Successful Bookings
Select * from Successful_Bookings;


-- 2. Find the average ride distance for each vehicle type:
Create view Average_ride_Distance as
Select Vehicle_Type,avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;

#2. Retriving all vehicles average ride distance
Select * from Average_Ride_Distance;



-- 3. Get the total number of cancelled rides by customers:
Create View Rides_Canceled_by_customers as
Select count(Booking_Status) as Total_rides_canceled_by_customer
from bookings where Booking_status = 'Canceled by Customer';

#3. Retriving all Rides Canceled by Customer
Select * from Rides_canceled_by_customers;


-- 4. List the top 5 customers who booked the highest number of rides:
Create view Top_5_customers as
Select Customer_ID,count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;

#4. Retriving all Top 5 customers
Select * from Top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view cancelled_by_drivers_P_c_Issues as
Select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#5. Retriving all rides cancelled by drivers due to personal issues
Select * from cancelled_by_drivers_P_c_issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view max_min_driver_rating_prime_sedan as
Select max(Driver_Ratings) as max_ratings,min(Driver_Ratings) as min_ratings
from bookings where Vehicle_Type = 'Prime Sedan';

#6. Retriving the maximum and minimum driver ratings for Prime Sedan bookings
Select * from max_min_driver_rating_prime_sedan;

-- 7. Retrieve all rides where payment was made using UPI:
Create View UPI_payemnts as
Select * from bookings
where Payment_Method = 'UPI';

#7. Retriving all rides where payment method is UPI
Select * from UPI_payemnts;

-- 8. Find the average customer rating per vehicle type:
create view Avg_Customer_Ratings as
Select Vehicle_type,avg(Customer_Rating) as avg_customer_ratings from bookings
group by Vehicle_type;

#8. Retriving the Average Customer Ratings per Vehicle type
Select * from Avg_Customer_Ratings;

-- 9. Calculate the total booking value of rides completed successfully:
Create View Total_booking_value as
Select sum(Booking_Value) as Total_successful_Booking_Value from bookings
where Incomplete_Rides = 'No';


#9. Retriving the Total Booking Value of ride Completed successfully
Select * from Total_booking_value;

-- 10. List all incomplete rides along with the reason:
Create View Incomplete_rides_reason as
Select Booking_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';

#10. Retriving the Incomplete_rides_reason
Select * from Incomplete_rides_reason;
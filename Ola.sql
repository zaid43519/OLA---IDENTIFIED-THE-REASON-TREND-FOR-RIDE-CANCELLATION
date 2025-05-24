Create Database Ola;
use Ola;
#1. Retrieve all successful bookings:
Create View Successful_Bookings As 
SELECT * FROM Bookings 
WHERE Booking_Status="Success";

#1. Retrieve all successful bookings:
SELECT * FROM Successful_Bookings;


#2. Find the average ride distance for each vehicle type:
create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
group by Vehicle_Type;

#2. Find the average ride distance for each vehicle type:
SELECT * FROM ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customers As
SELECT COUNT(*) FROM Bookings 
WHERE Booking_Status = 'Canceled by Customer';

#3. Get the total number of cancelled rides by customers:
SELECT * FROM cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
Create View top_5_customers As
SELECT Customer_ID, COUNT(booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
#4. List the top 5 customers who booked the highest number of rides:
SELECT * FROM top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View cancelled_by_drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT * FROM cancelled_by_drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

#7. Retrieve all rides where payment was made using UPI:
SELECT * from UPI_Payment;

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) As avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

#8. Find the average customer rating per vehicle type:
SELECT * FROM AVG_Cust_Rating;

#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

#9. Calculate the total booking value of rides completed successfully:
SELECT * FROM total_successful_ride_value;

#10. List all incomplete rides along with the reason
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 'Yes';

#10. List all incomplete rides along with the reason
SELECT * FROM Incomplete_Rides_Reason;
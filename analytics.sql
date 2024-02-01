-- Find revenue trends by hourly rate
SELECT
    EXTRACT(
        HOUR
        FROM
            TIMESTAMP(tpep_pickup_datetime)
    ) AS pickup_hour,
    AVG(total_amount) AS average_revenue
FROM
    `uber-data-engineering-410202.uber_data_engineering_dataset.tbl_analytics`
GROUP BY
    pickup_hour
ORDER BY
    pickup_hour;

-- Find payment type preference
SELECT
    payment_type_name,
    COUNT(*) as amount
FROM
    `uber-data-engineering-410202.uber_data_engineering_dataset.tbl_analytics`
GROUP BY
    payment_type_name
ORDER BY
    2 -- Find cumulative earnings by pickup date
SELECT
    tpep_pickup_datetime,
    SUM(total_amount) OVER (
        ORDER BY
            tpep_pickup_datetime
    ) AS cumulative_earnings
FROM
    `uber-data-engineering-410202.uber_data_engineering_dataset.tbl_analytics`
ORDER BY
    tpep_pickup_datetime
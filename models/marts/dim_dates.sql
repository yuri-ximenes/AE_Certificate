with
    date_spine as (
        {{
            dbt_utils.date_spine(
                datepart="day",
                start_date="cast('2011-01-01' as date)",
                end_date="cast('2014-12-31' as date)"
            )
        }}
    )

    , final as (
        select
            cast(date_day as date) as date_day
            , year(date_day) as year
            , quarter(date_day) as quarter
            , month(date_day) as month
            , date_format(date_day, 'MMMM') as month_name
            , weekofyear(date_day) as week_of_year
            , dayofweek(date_day) as day_of_week
            , date_format(date_day, 'EEEE') as day_of_week_name
            , case when dayofweek(date_day) in (1, 7) then true else false end as is_weekend
        from date_spine
    )

select * from final

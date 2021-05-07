SELECT  postcodes_geo."postcode", postcodes_geo."suburb", solar_installations."Installations Solar 2019", solar_output."Output In kW Solar 2019",
solar_rating."Rating"
FROM solar_rating
right outer join Solar_output
ON solar_rating."Postcode from"  =  Solar_output."Postcode"
left outer join Solar_installations
ON solar_rating."Postcode from"  =  Solar_installations."Postcode"
left outer join postcodes_geo
ON   solar_rating."Postcode from" = postcodes_geo."postcode"
WHERE Solar_installations."Postcode" > 2999 AND Solar_installations."Postcode" < 3999;

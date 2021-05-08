----some of the queries----
SELECT * FROM solar_installations
SELECT * FROM solar_output
SELECT * FROM solar_rating
SELECT * FROM postcodes_geo

SELECT  postcodes_geo."postcode", postcodes_geo."suburb", solar_installations."Installations Solar 2019", solar_output."Output In kW Solar 2019",
solar_rating."Rating"
FROM solar_rating
right outer JOIN Solar_output
ON solar_rating."Postcode FROM"  =  Solar_output."Postcode"
LEFT OUTER JOIN Solar_installations
ON solar_rating."Postcode FROM"  =  Solar_installations."Postcode"
LEFT OUTER JOIN postcodes_geo
ON   solar_rating."Postcode FROM" = postcodes_geo."postcode"
WHERE Solar_installations."Postcode" > 2999 AND Solar_installations."Postcode" < 3999;

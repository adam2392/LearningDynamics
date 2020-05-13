function [dist] = haversine(lambda1,lambda2,phi1,phi2)
    
    function h = hav(theta) 
        h = ( 1 - cos(theta) )/2;
    end
   % dist = 2 * 6372.8 * asin(sqrt(sind((lat2-lat1)/2)^2 + cosd(lat1) * cosd(lat2) * sind((lon2 - lon1)/2)^2));
   dist = hav(phi2 - phi1) + cos(phi1)*cos(phi2)*hav(lambda2 - lambda1);
end
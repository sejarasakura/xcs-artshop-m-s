SELECT 
vw_customer_cart.*,
Painting.weight_g,
Painting.height_mm,
Painting.lenght_mm,
Painting.width_mm
FROM vw_customer_cart 
LEFT JOIN Painting 
ON Painting.art_id = vw_customer_cart.id;
/****** Object:  View dbo.MultiScanner1    Script Date: 5/1/2004 6:12:35 PM ******/
CREATE VIEW dbo.MultiScanner1 AS SELECT     TOP 100 PERCENT dbo.LogIns.LogInIP, multi1 = CASE WHEN logins.kdid < logins_1.kdid THEN logins.kdid ELSE logins_1.kdid END, 
                      multi2 = CASE WHEN logins.kdid < logins_1.kdid THEN logins_1.kdid ELSE logins.kdid END
FROM         dbo.LogIns INNER JOIN
                      dbo.LogIns LogIns_1 ON dbo.LogIns.LogInIP = LogIns_1.LogInIP AND dbo.LogIns.kdID <> LogIns_1.kdID
GROUP BY dbo.LogIns.LogInIP, CASE WHEN logins.kdid < logins_1.kdid THEN logins.kdid ELSE logins_1.kdid END, 
                      CASE WHEN logins.kdid < logins_1.kdid THEN logins_1.kdid ELSE logins.kdid END
ORDER BY CASE WHEN logins.kdid < logins_1.kdid THEN logins.kdid ELSE logins_1.kdid END, 
                      CASE WHEN logins.kdid < logins_1.kdid THEN logins_1.kdid ELSE logins.kdid END

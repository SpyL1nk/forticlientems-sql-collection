SELECT TOP (1000)
    Devices.host AS devicename,
    DATEADD(s, FortiClients.last_seen, '1970-01-01') AS lastseen
FROM [FCM_Default].[dbo].[FortiClients]
INNER JOIN Devices ON FortiClients.devices_id = Devices.id
WHERE DATEDIFF(second, DATEADD(s, FortiClients.last_seen, '1970-01-01'), GETDATE()) >= 86400 -- 24 hours
ORDER BY lastseen DESC;

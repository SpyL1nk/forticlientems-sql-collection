SELECT TOP (1000)
	FortiClients.devices_id AS device_id,
	Devices.host AS device_name,
    DATEADD(s, FortiClients.last_seen, '1970-01-01') AS last_seen
FROM [FCM_Default].[dbo].[FortiClients]
INNER JOIN [FCM_Default].[dbo].[Devices] ON FortiClients.devices_id = Devices.id
WHERE DATEDIFF(second, DATEADD(s, FortiClients.last_seen, '1970-01-01'), GETDATE()) >= 86400 -- 24 hours
ORDER BY last_seen DESC;

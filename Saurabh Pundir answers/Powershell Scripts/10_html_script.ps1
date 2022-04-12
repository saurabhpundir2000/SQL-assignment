
$html=@"
<html>
<head>
<title>hello</title>
</head>
<body>
<h1>hello <br>
<h3>I'm saurabh <br>
<h5>this is Practice Assignment
</body>
</html>
"@

$html|out-file pe.html
Get-Content pe.html
Invoke-item pe.html
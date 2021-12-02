$dnslist = Get-Content ./dnslist_2021-11.txt

$Results = foreach ($villain in $dnslist)
{
    Resolve-DNSName -type A -Name $villain -DnsOnly -QuickTimeout -ErrorAction SilentlyContinue 
}

$Results | Select Name,IPAddress | Export-Csv c:\DnsBarring\dataDump\dgaB$((Get-date).ToString("yyyyMMdd")).csv -NoTypeInformation -Delimiter ";"
function Test-UrlLocation {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [array]$Url
    )

    begin {
        Write-Debug "[$(Get-TimeStamp)][$($MyInvocation.MyCommand.Name)] Function started"
        $testUrlObject = @()
    }

    process {
        foreach ($link in $Url) {
            if ($link -match 'r18.com') {
                if ($link -match 'lg=zh') {
                    $testUrlObject += [pscustomobject]@{
                        Url    = $link
                        Result = 'r18zh'
                    }
                } else {
                    $testUrlObject += [pscustomobject]@{
                        Url    = $link
                        Result = 'r18'
                    }
                }
            } elseif ($link -match 'javlibrary.com') {
                if ($link -match '/ja/') {
                    $testUrlObject += [pscustomobject]@{
                        Url    = $link
                        Result = 'javlibraryja'
                    }
                } elseif ($link -match '/cn/') {
                    $testUrlObject += [pscustomobject]@{
                        Url    = $link
                        Result = 'javlibraryzh'
                    }
                } elseif ($link -match '/tw/') {
                    $testUrlObject += [pscustomobject]@{
                        Url    = $link
                        Result = 'javlibraryzh'
                    }
                } else {
                    $testUrlObject += [pscustomobject]@{
                        Url    = $link
                        Result = 'javlibrary'
                    }
                }
            } elseif ($link -match 'dmm.co.jp') {
                $testUrlObject = [pscustomobject]@{
                    Url    = $link
                    Result = 'dmm'
                }
            } elseif ($link -match 'javbus') {
                if ($link -match '/ja') {
                    $testUrlObject = [pscustomobject]@{
                        Url    = $link
                        Result = 'javbusja'
                    }
                } else {
                    $testUrlObject = [pscustomobject]@{
                        Url    = $link
                        Result = 'javbus'
                    }
                }
            } elseif ($link -match 'jav321.com') {
                $testUrlObject = [pscustomboject]@{
                    Url    = $link
                    Result = 'jav321'
                }
            } else {
                Write-Warning "[$(Get-TimeStamp)][$($MyInvocation.MyCommand.Name)] Url: [$Url] not matched"
            }
        }
        Write-Output $testUrlObject
    }

    end {
        Write-Debug "[$(Get-TimeStamp)][$($MyInvocation.MyCommand.Name)] Function ended"
    }
}

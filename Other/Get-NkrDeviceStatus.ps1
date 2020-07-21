param(
#What HTTP site to connect to
$HTTPTest="google.com",

#What to ping
$PingTest="9.9.9.9",

#How often to check
$PollingSeconds=5)
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()




#region begin GUI{ 

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Polling Check"
$Form.TopMost                    = $false


$NotifyIcon = New-Object System.Windows.Forms.NotifyIcon
$NotifyIcon.Visible = $true;



$PollingTimer = New-Object System.Windows.Forms.Timer
$PollingTimer.Interval = 1000*$PollingSeconds;
$PollingTimer.Add_Tick({TimerTick})


#region gui events {
#endregion events }

#endregion GUI }


function New-SolidIcon ([System.Drawing.Color]$Color) {
    $tBitmap = New-Object System.Drawing.Bitmap 32,32
    $tBitmapGraphics = [System.Drawing.Graphics]::FromImage( $tBitmap)
    $tBitmapGraphics.FillRectangle( (new-object System.Drawing.SolidBrush ($Color)),0,0,32,32)
    $tBitmapGraphics.Flush();
    return ([System.Drawing.Icon]::FromHandle($tBitmap.GetHicon()))
}


$GreenIcon = New-SolidIcon ([System.Drawing.Color]::Green)
$RedIcon = New-SolidIcon ([System.Drawing.Color]::Red)

$NotifyIcon.Icon = $RedIcon;

#Write your logic code here


function TimerTick() {
    $PassedTests = 0;
    $RunTests = 0;

    #Check for HTTPS connection to Google
    $RunTests++;
    $wr = $null;
    $wr = (iwr -UseBasicParsing -Uri $HTTPTest -TimeoutSec 1)
    if($wr -ne $null) {
        $PassedTests++;
        
    }

    #Check we can ping 
    $RunTests++;
    $Ping = [System.Net.NetworkInformation.Ping]::new()
    if($Ping.Send($PingTest).Status -eq "Success") {
        $PassedTests++;
        
    }

    $NotifyIcon.Text = "Passed $PassedTests/$RunTests tests"

    if($PassedTests -eq $RunTests) {
        $NotifyIcon.Icon = $GreenIcon
        $Form.BackColor = ([System.Drawing.Color]::Green)
    }else{
        $NotifyIcon.Icon = $RedIcon
        $Form.BackColor = ([System.Drawing.Color]::Red)
    }
}

$PollingTimer.Start()

[void]$Form.ShowDialog()
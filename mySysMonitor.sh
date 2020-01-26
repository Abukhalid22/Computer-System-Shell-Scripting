#!/bin/bash


##### Constants

HOST=$(hostname)
TITLE="System Information for $USER"
TIME=$(date)
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"
UPTIME=$(uptime)
HTML_FILE=$HOME/mySysMonitor.html

##### Functions


curr_Procceses()
{
    date

    echo "<h2>Current processes</h2>"
    echo "<pre>"
    CURPROC=`top -i -b -n1 -d1`
    echo  "$CURPROC" 
    echo ""
    echo  "$TIME_STAMP" 
    echo "</pre>" > $HTML_FILE

}

show_Users()
{
    date

    echo "<h2>Users Currently Logged in</h2>"
    echo "<pre>"
    Users= w
    echo "$Users"
    echo ""
    echo  "$TIME_STAMP" 
    echo "</pre>" > $HTML_FILE
}

DiskUsg()
{
    date
 
    echo "<h2>Disk Usage</h2>"
    echo "<pre>"
    DiskUsage= df -H
    echo "$DiskUsage"
    echo ""
    echo "Users Home Directory:" $HOME
    echo ""
    echo  "$TIME_STAMP" 
    echo "</pre>" > $HTML_FILE
}

Network()
{
    date
    
    echo "<h2>Network interfaces and their states</h2>"
    echo "<pre>"
    Net= ip -s link
    echo "$Net"
    echo ""
    echo  "$TIME_STAMP" 
    echo "</pre>" > $HTML_FILE
}

PluggedDevices()
{
      
    date

    echo "<h2>Devices plugged in</h2>"
    echo "<pre>"
    Plugged= lsblk
    echo "$Plugged"
    echo ""
    echo  "$TIME_STAMP" 
    echo "</pre>" > $HTML_FILE
}







##### Main
while sleep 1
do
printf '%s\n' "$(clear;)"
cat <<- _EOF_
    <html>
    <head>
    <title>$TITLE</title>
	<meta http-equiv="refresh" content="10">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


<style>

body{
margin: 10px;
}

.my-container{


border:1px solid green;

}

.my-row{
border: 3px solid red;
}


.my-col{
border:3px dotted blue;
}



h2{
text-align: center;
}


</style>


    </head>

    <body>
<h2>$TITLE</h2>
<h2>$RIGHT_NOW</h2>
<h2>$UPTIME</h2>

<div class="container my-container">
<div class="row my-row">
<div class="col-7 my-col">
$(curr_Procceses)
</div>
<div class="col-5 my-colD">
$(DiskUsg)
</div>
</div>

<div class="row my-row">
<div class="col-7 my-col">
$(PluggedDevices)
</div>
<div class="col-5 my-col">
$(Network)
</div>
</div>

<div class="row my-row">
<div class="col my-col">
$(show_Users)
</div>
</div>

</div>





 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
    </html>
_EOF_
done

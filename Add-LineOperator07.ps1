

# https://ej2.syncfusion.com/documentation/listview/how-to/add-and-remove-list-items-from-listview/
# https://www.w3schools.com/css/css_table_size.asp
# https://www.w3schools.com/css/tryit.asp?filename=trycss_form_responsive


Function Add-LineOperator07 {

### HTML Form
$form = @"
<!DOCTYPE html>
<html>
<head>
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #0066ff;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

<h1>Get order</h1>

<div class="container">
  <form action='/LineOperator07/GetOrder' method='post'>
  <div class="row">
    <div class="col-25">
      <label for="ordernumber">Order Number</label>
    </div>
    <div class="col-75">
      <input type="text" id="ordernumber" name="ordernumber" placeholder="Enter the ordernumber">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="printamount">Amount to print</label>
    </div>
    <div class="col-75">
      <input type="text" id="printamount" name="printamount" placeholder="Enter the amount of orders to print">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
    </div>
  </div>
  <div class="row">

  </div>
  <br>
  <div class="row">
    <input type="submit" value="Get Order">
  </div>
  </form>
</div>

</body>
</html>
"@

### List servers in html

$content = @"
<!DOCTYPE html>
<html>
<head>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #0066ff;
  color: white;
}
</style>
</head>
<body>

<h1>Print List</h1>

<table id='customers'>
  <tr>
    <th>Print amount</th>
    <th>country</th>
    <th>car</th>
    <th>currency</th>
  </tr>
"@

$htmltable = @"
</table>

  </div>
  <form action='/LineOperator07/Print' method='post'>
  <br>
  <div class="row">
  <input type="submit" value="Print now">
  </form>      
  </div>

</body>


</table>

  </div>
  <form action='/LineOperator07/ClearPrintJobs' method='post'>
  <br>
  <div class="row">
  <input type="submit" value="Clear print jobs">
  </form>      
  </div>

</body>
</html>
"@

# Create HTML File
New-Item -Path ".\LineOperator07.html" -ItemType File -Value $form -Force
Add-Content -Path ".\LineOperator07.html" -Value $content -Force

# Get Content of order number
If (Test-Path -Path ".\DataToPrint\L07\temp\$ordernumber.csv") {
$ordernumbercontent = Get-content ".\DataToPrint\L07\temp\$ordernumber.csv" | ConvertFrom-Csv -Delimiter ','
}
Else
{ 
Write-Host 'order not found... -f Red'
}

foreach ($lines in $ordernumbercontent){
    Add-Content -Value "  <tr>" -LiteralPath .\LineOperator07.html -Force
    Add-Content -Value "<td>$($printamount)</td>" -LiteralPath .\LineOperator07.html -Force
    Add-Content -Value "<td>$($selectedOrder.country)</td>" -LiteralPath .\LineOperator07.html -Force
    Add-Content -Value "<td>$($selectedOrder.car)</td>" -LiteralPath .\LineOperator07.html -Force
    Add-Content -Value "<td>$($selectedOrder.currency)</td>" -LiteralPath .\LineOperator07.html -Force
    Add-Content -Value "  </tr>" -LiteralPath .\LineOperator07.html -Force    
}

Add-Content -Value $htmltable -LiteralPath .\LineOperator07.html -Force
}

#    <form action='/clear' id="ClearServers" method='post'>
#    <input type='reset' and add onclick='document.forms["ClearServers"].submit();'>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HCL BANK</title>
<style>
    #trans{
        margin-top: 250px;
        text-align: center;
    }
    button{
        text-decoration: none;
        font-size: 1rem;
        margin: 10px;
        text-align: center;
        font-weight: 12px;
        padding: 11px;
        border: 3px solid #000;
        text-transform: uppercase;
        letter-spacing: 4px;
        border-radius: 100px;
        color: purple;
    }
</style>
</head>
<body style="background-color: aquamarine;">
<script type="text/javascript">                                                                                 
function doSubmit()
{
	window.open("TranDisplay.jsp","_self");
}
function doSubmit1()
{
	window,open("AmountDisplay.jsp","_self");
}
</script>
    <button name="button" type="button" onclick="doSubmit1();">Fund Debit Transfer</button>
    <button name="button" type="button" onclick="doSubmit();">Display Transactions</button>
</body>
</html>
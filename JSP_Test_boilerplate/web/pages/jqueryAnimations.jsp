<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script src="../scripts/jquery-2.2.2.min.js"></script>
<button type="button">new div</button>
<div id="clickme">
  Click here
</div>
<img id="code" src="../images/code-icon.png" alt="" width="100" height="123"
  style="position: relative; left: 10px;">


<script>
$( document ).ready(function() {
	$( "#clickme" ).click(function() {
		  $( "#code" ).animate({
		    opacity: 0.25,
		    left: "+=50",
		    height: "toggle"
		  }, 5000, function() {
		    // Animation complete.
		  });
		});
	
	
    $( "button" ).on( "click", function() {
        var para = document.createElement("p");
        var node = document.createTextNode("This is new.");
        para.appendChild(node);
        var element = document.getElementById("clickme");
        element.appendChild(para);
		console.log( "A button with the alert class was clicked!" );
    });

});
</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Centennial College</title>
</head>
<body>
    <h1 id="greeting-message">Welcome to COMP367</h1>
    <script>
        // JavaScript code to determine the time of day
        var currentTime = new Date();
        var currentHour = currentTime.getHours();

        var greetingMessage = document.getElementById("greeting-message");

        if (currentHour >= 5 && currentHour < 12) {
            greetingMessage.innerHTML = "Good morning, Tannus!<br> Welcome to COMP367";
        } else if (currentHour >= 12 && currentHour < 18) {
            greetingMessage.innerHTML = "Good afternoon, Tannus!<br> Welcome to COMP367";
        } else {
            greetingMessage.innerHTML = "Good evening, Tannus!<br> Welcome to COMP367";
        }
    </script>
</body>
</html>

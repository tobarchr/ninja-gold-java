<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../resources/static/css/style.css">
    <title>Ninja Money</title>
    <style>
        *{
    border-radius: 5px;
}
#container{
    background-color: #6b7b8c;
    margin: auto;
    padding: 10px;
    width: 1080px;
    height: 600px;
}
#coins_form{
    background-color: #6b7b8c;
    border: 10px;
}
input[type=submit]{
    background-color: #efbb10;
    color: #3b4d61;
    padding: 15px 20px;
    border: none;
}

form{
    background-color: #3b4d61;
    color: white;
    flex: auto;
    margin: 10px;
    padding: 25px;
}
#boxes{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    text-align: center;
    margin: 10px;
}

#data{
    width: 100%;
    height: 150px;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    background-color: #f8f8f8;
    resize: none;
}
    </style>
</head>
<body>
    <div id="container">
        <form id="coins_form">
            <label style="padding: 20px; font-size: 20px;">Your Gold:</label>
            <input type ="text" id="coins" name="coins" value="${count}" readonly
            style= "padding: 5px; text-align: center;">
        </form>
        <div id ="boxes">`
            <form action="process_money" method="POST">
                <input type ="hidden" name="which_form" value="farm">
                <h2>Farm</h2>
                <p>(earns 10-20 golds)</p>
                <input type="submit" value="Find Gold!" class="submit_button">
            </form>
            <form action="process_money" method="POST">
                <input type ="hidden" name="which_form" value="cave">
                <h2>Cave</h2>
                <p>(earns 5-10 golds)</p>
                <input type="submit" value="Find Gold!" class="submit_button">
            </form>
            <form action="process_money" method="POST">
                <input type ="hidden" name="which_form" value="house">
                <h2>House</h2>
                <p>(earns 2-5 golds)</p>
                <input type="submit" value="Find Gold!" class="submit_button">
            </form>
            <form action="process_money" method="POST">
                <input type ="hidden" name="which_form" value="casino">
                <h2>Casino</h2>
                <p>(earns/takes 0-50 golds)</p>
                <input type="submit" value="Find Gold!" class="submit_button">
            </form>
        </div>
        <div>
            <form>
                <h3>Activities:</h3>
            <textarea id="log" name="log" rows="10" cols="120">
                <c:forTokens items = "${actions}" delims = "," var = "name">
                    <c:out value = "${name}"/>
                </c:forTokens>
            </textarea>
            </form>

        </div>
    </div>
<script>
        document.getElementById("log").scrollTop = document.getElementById("log").scrollHeight
</script>
</body>
</html>
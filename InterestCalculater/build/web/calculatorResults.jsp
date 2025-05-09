<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculation Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: pink;
            padding: 20px;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        .result {
            font-size: 1.2em;
            margin-top: 20px;
        }
        .result-label {
            font-weight: bold;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
        .back-link a {
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Calculation Results</h1>

        <div class="result">
            <span class="result-label">Calculation Type:</span> ${calcType}<br>
            <span class="result-label">Amount:</span> ${amount}<br>
            <span class="result-label">Rate (%):</span> ${rate}<br>
            <span class="result-label">Time (years):</span> ${time}<br>
            <span class="result-label">Result:</span> ${resultsStr}<br>
        </div>

        <div class="back-link">
            <a href="index.html">Go Back to Calculator</a>
        </div>
    </div>

</body>
</html>

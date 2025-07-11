<%-- 
    Document   : calculator
    Created on : May 6, 2025, 7:32:45 PM
    Author     : thandolwethu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Interest Vat</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #fce4ec; 
                padding: 40px;
                margin: 0;
            }

            .box {
                background: white;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
                max-width: 600px;
                margin: auto;
            }

            h2 {
                text-align: center;
                color: #e91e63; /* strong pink */
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-top: 15px;
                font-weight: bold;
                color: #333;
            }

            input, select {
                width: 100%;
                padding: 12px;
                margin-top: 5px;
                border: 2px solid #e91e63;
                border-radius: 8px;
                font-size: 16px;
                background-color: #fff0f5;
            }

            input:focus, select:focus {
                outline: none;
                border-color: #d81b60;
                background-color: #fff;
            }

            #button {
                width: 100%;
                padding: 14px;
                margin-top: 20px;
                background-color: #e91e63;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            #button:hover {
                background-color: #c2185b;
            }

            #result {
                margin-top: 25px;
                padding: 15px;
                background-color: #f8bbd0;
                border-left: 6px solid #c2185b;
                font-weight: bold;
                color: black;
                border-radius: 8px;
            }
        </style>
    </head>
    <body>

        <div class="box">
            <h2>Interest & VAT Calculator</h2>

            <form action="CalculateVatServlet.do" method="POST">
                <label for="calcType">Choose calculation:</label>
                <select id="calcType" name="calcType">
                    <option value="Simple Interest">Simple Interest</option>
                    <option value="Compound Interest">Compound Interest</option>
                    <option value="Add VAT (price before VAT)">Add VAT (price before VAT)</option>
                </select>

                <label for="amount">Amount:</label>
                <input type="number" id="amount" placeholder="Enter amount (e.g. R1000)" min="0" name="amount" required="">

                <label for="rate">Rate (%):</label>
                <input type="number" id="rate" placeholder="Enter rate (%)" min="0" max="100" name="rate" required="">

                <label for="time">Time (years) — for interest only:</label>
                <input type="number" id="time" placeholder="Enter time (in years)" min="0" name="time" required="">

                <input type="submit" value="Calculate" id="button">

            </form>
        </div>
    </body>
</html>




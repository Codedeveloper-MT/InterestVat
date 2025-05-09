<%-- 
    Document   : calculatorResults
    Created on : May 8, 2025, 11:43:22 AM
    Author     : Khotso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Calculation Results</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #fce4ec;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .result-container {
                background: white;
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                width: 90%;
                animation: fadeIn 0.8s ease;
            }

            h1 {
                color: #e91e63;
                text-align: center;
                margin-bottom: 30px;
                font-size: 2.2rem;
            }

            .result-box {
                background-color: #fff0f5;
                border-left: 6px solid #e91e63;
                padding: 25px;
                border-radius: 8px;
                margin-bottom: 30px;
            }

            .result-item {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
                padding-bottom: 15px;
                border-bottom: 1px dashed #e91e63;
            }

            .result-item:last-child {
                border-bottom: none;
                margin-bottom: 0;
                padding-bottom: 0;
            }

            .result-label {
                font-weight: 600;
                color: #333;
            }

            .result-value {
                font-weight: 700;
                color: #e91e63;
            }

            .btn-container {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-top: 30px;
            }

            .btn {
                padding: 12px 30px;
                border-radius: 50px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                border: none;
                font-size: 1rem;
            }

            .btn-primary {
                background-color: #e91e63;
                color: white;
            }

            .btn-secondary {
                background-color: #9e9e9e;
                color: white;
            }

            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(20px); }
                to { opacity: 1; transform: translateY(0); }
            }
        </style>
    </head>
    <body>
        <div class="result-container">
            <h1>Your Calculation Results</h1>

            <%
                String calcType = (String)request.getAttribute("calcType");
                Double amount = (Double)request.getAttribute("amount");
                Double rate = (Double)request.getAttribute("rate");
                Double time = (Double)request.getAttribute("time");
                String resultsStr = (String)request.getAttribute("resultsStr");
                String totalAmoutStr = (String)request.getAttribute("totalAmoutStr");
            %>

            <div class="result-box">
                <div class="result-item">
                    <span class="result-label">Calculation Type:</span>
                    <span class="result-value"><%=calcType%></span>
                </div>
                <div class="result-item">
                    <span class="result-label">Principal Amount:</span>
                    <span class="result-value">R<%=amount%></span>
                </div>
                <div class="result-item">
                    <span class="result-label">Rate:</span>
                    <span class="result-value"><%=rate%>%</span>
                </div>
                <div class="result-item">
                    <span class="result-label">Time:</span>
                    <span class="result-value"><%=time%> years</span>
                </div>
                <div class="result-item">
                    <span class="result-label">Interest/VAT Amount:</span>
                    <span class="result-value"><%=resultsStr%></span>
                </div>
                <div class="result-item">
                    <span class="result-label">Total Amount:</span>
                    <span class="result-value"><%=totalAmoutStr%></span>
                </div>
            </div>

            <div class="btn-container">
                <a href="calculator.html" class="btn btn-primary">New Calculation</a>
                <a href="index.html" class="btn btn-secondary">Back to Home</a>
            </div>
        </div>
    </body>
</html>


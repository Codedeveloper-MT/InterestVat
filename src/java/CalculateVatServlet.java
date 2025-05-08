/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.InterestVatSBLocal;

/**
 *
 * @author Khotso
 */
public class CalculateVatServlet extends HttpServlet {

    @EJB
    InterestVatSBLocal ovl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String calcType = request.getParameter("calcType");
        Double amount = Double.parseDouble(request.getParameter("amount"));
        Double rate = Double.parseDouble(request.getParameter("rate"));
        Double time = Double.parseDouble(request.getParameter("time"));
        Double results = 0.0;
        Double totalAmout = 0.0;

        if (calcType.equalsIgnoreCase("Simple Interest")) {
            DecimalFormat df = new DecimalFormat("R#,##0.00");

            results = ovl.simpleInterest(rate, time, amount);
            String resultsStr = df.format(results);

            totalAmout = results + amount;
            String totalAmoutStr = df.format(totalAmout);

            request.setAttribute("resultsStr", resultsStr);
            request.setAttribute("totalAmoutStr", totalAmoutStr);

        } else if (calcType.equalsIgnoreCase("Compound Interest")) {
            DecimalFormat df = new DecimalFormat("R#,##0.00");

            results = ovl.compoundIntrest(amount, time, rate);
            String resultsStr = df.format(results);

            totalAmout = results + amount;
            String totalAmoutStr = df.format(totalAmout);

            request.setAttribute("resultsStr", resultsStr);
            request.setAttribute("totalAmoutStr", totalAmoutStr);
        } else if (calcType.equalsIgnoreCase("Add VAT (price before VAT)")) {
            DecimalFormat df = new DecimalFormat("R#,##0.00");

            results = ovl.addVatPrice(rate, amount);
            String resultsStr = df.format(results);

            totalAmout = results + amount;
            String totalAmoutStr = df.format(totalAmout);

            request.setAttribute("resultsStr", resultsStr);
            request.setAttribute("totalAmoutStr", totalAmoutStr);
        }

        request.setAttribute("calcType", calcType);
        request.setAttribute("amount", amount);
        request.setAttribute("rate", rate);
        request.setAttribute("time", time);

        RequestDispatcher disp = request.getRequestDispatcher("calculatorResults.jsp");
        disp.forward(request, response);
    }
}

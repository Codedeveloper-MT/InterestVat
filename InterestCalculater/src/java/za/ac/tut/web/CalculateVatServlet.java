package za.ac.tut.web;

import java.io.IOException;
import java.text.DecimalFormat;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.InterestVatSBLocal;

/**
 * Servlet to calculate VAT and interest
 * @author thandolwethu
 */
public class CalculateVatServlet extends HttpServlet {

    @EJB
    private InterestVatSBLocal ovl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // You can forward to index.jsp or show a message if needed
        response.getWriter().write("Please use the form to submit data.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String calcType = request.getParameter("calcType");

        double amount = Double.parseDouble(request.getParameter("amount"));
        double rate = Double.parseDouble(request.getParameter("rate"));
        double time = Double.parseDouble(request.getParameter("time"));

        double results = 0.0;
        double totalAmount = 0.0;
        DecimalFormat df = new DecimalFormat("R#,##0.00");

        if (calcType.equalsIgnoreCase("Simple Interest")) {
            results = ovl.simpleInterest(rate, time, amount);
            totalAmount = results + amount;

        } else if (calcType.equalsIgnoreCase("Compound Interest")) {
            results = ovl.compoundIntrest(amount, time, rate);
            totalAmount = results + amount;

        } else if (calcType.equalsIgnoreCase("Add VAT (price before VAT)")) {
            results = ovl.addVatPrice(rate, amount);
            totalAmount = results + amount;
        }

        request.setAttribute("resultsStr", df.format(results));
        request.setAttribute("totalAmoutStr", df.format(totalAmount));
        request.setAttribute("calcType", calcType);
        request.setAttribute("amount", amount);
        request.setAttribute("rate", rate);
        request.setAttribute("time", time);

        RequestDispatcher disp = request.getRequestDispatcher("calculatorResults.jsp");
        disp.forward(request, response);
    }
}

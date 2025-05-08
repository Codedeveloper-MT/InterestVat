/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;


import javax.ejb.Stateless;

/**
 *
 * @author Khotso
 */
@Stateless
public class InterestVatSB implements InterestVatSBLocal {

    @Override
    public Double compoundIntrest(double principal, double time, double rate) {
        double amount;
        amount = principal * Math.pow(1 + rate / 100, time);
        return amount - principal;
    }

    @Override
    public Double simpleInterest(double rate, double time, double principal) {
//        double simpleInt;
        return (principal * rate * time) / 100;
//         principal + simpleInt;
    }

    @Override
    public Double addVatPrice(double rate, double price) {
//        double priceBeforeVAT;
        return price * (rate / 100);
//        return price - priceBeforeVAT;
    }

    @Override
    public Double extractVAT(double priceBeforeVAT, double price, double rate) {
        return price / (1 + (rate / 100));
    }

}

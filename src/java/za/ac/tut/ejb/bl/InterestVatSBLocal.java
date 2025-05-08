/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import javax.ejb.Local;

/**
 *
 * @author Khotso
 */
@Local
public interface InterestVatSBLocal {

    Double compoundIntrest(double pricipal, double time, double rate);

    Double simpleInterest(double rate, double time, double principal);

    Double addVatPrice(double rate, double price);

    Double extractVAT(double priceBeforeVAT, double price, double rate);
    
}

package paymentprocessing;

import java.util.Date;

public class CreditCardDetails {

	private String cardNumber;
	private int cvv;
	private Date cardDate;

	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public int getCvv() {
		return cvv;
	}
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	public Date getCardDate() {
		return cardDate;
	}
	public void setCardDate(Date cardDate) {
		this.cardDate = cardDate;
	}




}

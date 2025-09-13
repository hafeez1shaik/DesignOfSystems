package paymentprocessing;

public class CreditCardStrategy implements IPaymentStrategy {

	private double amount;
	private CreditCardDetails cardDetails;

	public CreditCardStrategy(double amount, CreditCardDetails details) {
		this.amount = amount;
		this.cardDetails = details;
	}

	@Override
	public void pay(double amount) {
		System.out.print("Executing Credit Card Payment");

	}

}

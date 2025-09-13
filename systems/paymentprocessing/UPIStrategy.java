package paymentprocessing;

public class UPIStrategy implements IPaymentStrategy {
	
	private double amount;
	private String upiId;

	public UPIStrategy(double amount, String upiId) {
		this.amount = amount;
		this.upiId = upiId;
	}
	

	@Override
	public void pay(double amount) {
		System.out.println("Executing UPI payment strategy");

	}

}

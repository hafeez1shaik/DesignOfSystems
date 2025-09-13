package paymentprocessing;

public class WalletPaymentStrategy implements IPaymentStrategy {

	private double amount;

	public WalletPaymentStrategy(double amount) {
		this.amount = amount;
	}

	@Override
	public void pay(double amount) {
		// TODO Auto-generated method stub
		System.out.println("Executing Wallet Payment Strategy");

	}

}

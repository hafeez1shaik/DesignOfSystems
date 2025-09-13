package paymentprocessing;

public class NetBankingStrategy implements IPaymentStrategy {

	private double amount;
	private NetBankingDetails details;

	public NetBankingStrategy(double amount, NetBankingDetails details) {
		this.amount = amount;
		this.details = details;
	}

	@Override
	public void pay(double amount) {
		// TODO Auto-generated method stub
		System.out.println("Executing Net Banking Strategy");
	}

}

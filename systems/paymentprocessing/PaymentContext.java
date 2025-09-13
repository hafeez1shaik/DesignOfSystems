package paymentprocessing;

public class PaymentContext implements IPaymentContext {

	IPaymentStrategy paymentStrategy;

	public PaymentContext(IPaymentStrategy strategy) {
		this.paymentStrategy = strategy;
	}

	@Override
	public void pay() {
		this.paymentStrategy.pay(123.44);
	}

	
	
}

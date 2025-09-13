package paymentprocessing;

import java.util.Date;

public class ECommerceApp {
	public static void main(String[] args) {
		double billAmount = 1250.75;

		CreditCardDetails details = new CreditCardDetails();
		details.setCardDate(new Date());
		details.setCardNumber("1234-5678-9101");
		details.setCvv(123);

		NetBankingDetails nbDetais = new NetBankingDetails();
		nbDetais.setAccountNumber(12798392);
		nbDetais.setBranchCode("AXIS1244");
		nbDetais.setIFSC("UTI00000234");

		PaymentContext upi = new PaymentContext(new UPIStrategy(billAmount, "shaik@ybl"));
		PaymentContext netbanking = new PaymentContext(new NetBankingStrategy(billAmount, nbDetais));
		PaymentContext cc = new PaymentContext(new CreditCardStrategy(billAmount, details));
		PaymentContext wallet = new PaymentContext(new WalletPaymentStrategy(billAmount));

		upi.pay();
		netbanking.pay();
		cc.pay();
		wallet.pay();

	}
}

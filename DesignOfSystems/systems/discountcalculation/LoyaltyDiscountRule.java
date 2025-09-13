package discountcalculation;

public class LoyaltyDiscountRule implements DiscountRule {

	@Override
	public boolean isRuleApplicable(double MRP, CustomerContext context) {
		return context.isLoyalCustomer();
	}

}

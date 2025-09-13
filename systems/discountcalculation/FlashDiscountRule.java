package discountcalculation;

public class FlashDiscountRule implements DiscountRule {

	@Override
	public boolean isRuleApplicable(double MRP, CustomerContext context) {
		return context.getCoupon() == DiscountCoupon.FLASH_SALE;
	}

}

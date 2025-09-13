package discountcalculation;

import discountcalculation.DiscountLogger.Level;

public class DiscountCalculator {

	public static void main(String[] args) {
		final double amount = 200.45;
		DiscountLogger.log("Calculating Discounts with various Discount options", Level.INFO);
		DiscountStrategy empDiscount = new GenericDiscountStrategy(DiscountCoupon.EMPLOYEE_DISCOUNT);
		DiscountStrategy festDiscount = new GenericDiscountStrategy(DiscountCoupon.FESTIVAL_SALE);
		DiscountStrategy flashDiscount = new GenericDiscountStrategy(DiscountCoupon.FLASH_SALE);
		DiscountStrategy loyaltyDiscount = new GenericDiscountStrategy(DiscountCoupon.LOYALTY_COUPON);
		DiscountStrategy compositeDiscount = new GenericDiscountStrategy(DiscountCoupon.FESTIVAL_SALE,
				DiscountCoupon.FLASH_SALE);

		DiscountLogger.logLineWithHeader("Prices after applying Discounts");
		DiscountLogger.log("Employee Discounted Price : " + empDiscount.applyDiscount(amount), Level.INFO);
		DiscountLogger.log("Festival Discounted Price : " + festDiscount.applyDiscount(amount), Level.INFO);
		DiscountLogger.log("Flash Discounted Price : " + flashDiscount.applyDiscount(amount), Level.INFO);
		DiscountLogger.log("Loyalty Discounted Price : " + loyaltyDiscount.applyDiscount(amount), Level.INFO);
		DiscountLogger.log("Festival, Flash Discount Price : " + compositeDiscount.applyDiscount(amount), Level.INFO);
		
		
		DiscountLogger.log("Calculating Discounts based on rules", Level.INFO);
		CustomerContext context = new CustomerContext();
		context.setCoupon(DiscountCoupon.EMPLOYEE_DISCOUNT);
		context.setEmployee(true);
		context.setLoyaltyCustomer(false);
		
		DiscountStrategy empDiscountV1 = new GenericDiscountStrategy(context);

		DiscountLogger.logLineWithHeader("Prices after applying Discounts");
		DiscountLogger.log("Employee Discounted Price : " + empDiscountV1.applyDiscount(amount), Level.INFO);
		
	}

}

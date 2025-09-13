package discountcalculation;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class GenericDiscountStrategy implements DiscountStrategy {
	private DiscountCoupon[] coupons;
	private CustomerContext context;

	public GenericDiscountStrategy(DiscountCoupon... coupon) {
		this.coupons = coupon;
	}

	public GenericDiscountStrategy(CustomerContext context) {
		this.coupons = new DiscountCoupon[] { context.getCoupon() };
		this.context = context;

	}

	@Override
	public double applyDiscount(double MRP) {
		if (context != null && !DiscountExecutor.execute(MRP, context)) {
			return MRP;
		}

		double price = MRP;
		for (DiscountCoupon coupon : coupons) {
			price -= (DiscountMap.getDiscountCoupon(coupon) / 100) * price;
		}

		return getPrecisonValue(price);
	}

	private double getPrecisonValue(Double discountedPrice) {
		return new BigDecimal(String.valueOf(discountedPrice)).setScale(2, RoundingMode.HALF_UP).doubleValue();
	}

}

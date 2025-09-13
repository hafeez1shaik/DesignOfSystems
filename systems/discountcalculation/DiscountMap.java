package discountcalculation;

import java.util.HashMap;
import java.util.Map;

public class DiscountMap {

	// TODO This can read the discount map from properties in future

	private DiscountMap() {

	}

	static Map<DiscountCoupon, Double> map = new HashMap<>();

	static {
		map.put(DiscountCoupon.EMPLOYEE_DISCOUNT, 40.00);
		map.put(DiscountCoupon.FESTIVAL_SALE, 20.00);
		map.put(DiscountCoupon.FLASH_SALE, 30.00);
		map.put(DiscountCoupon.LOYALTY_COUPON, 50.00);

	}

	public static double getDiscountCoupon(DiscountCoupon coupon) {
		return map.get(coupon);

	}

}

package discountcalculation;

public class CustomerContext {

	private DiscountCoupon coupon;
	private boolean isLoyaltyCustomer;
	private boolean isEmployee;

	public DiscountCoupon getCoupon() {
		return coupon;
	}

	public void setCoupon(DiscountCoupon coupon) {
		this.coupon = coupon;
	}

	public boolean isLoyalCustomer() {
		return isLoyaltyCustomer;
	}

	public void setLoyaltyCustomer(boolean isLoyaltyCustomer) {
		this.isLoyaltyCustomer = isLoyaltyCustomer;
	}

	public boolean isEmployee() {
		return isEmployee;
	}

	public void setEmployee(boolean isEmployee) {
		this.isEmployee = isEmployee;
	}

}

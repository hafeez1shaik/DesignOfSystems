package discountcalculation;

public class EmployeeDiscountRule implements DiscountRule {

	@Override
	public boolean isRuleApplicable(double MRP, CustomerContext context) {
		return context.isEmployee();
	}

}

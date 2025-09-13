package discountcalculation;

public interface DiscountRule {


	boolean isRuleApplicable(double MRP, CustomerContext context);

}

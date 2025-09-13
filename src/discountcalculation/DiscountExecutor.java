package discountcalculation;

import java.lang.reflect.InvocationTargetException;
import java.util.Set;
import java.util.regex.Pattern;

import org.reflections.Reflections;
import org.reflections.scanners.Scanners;
import org.reflections.util.ClasspathHelper;
import org.reflections.util.ConfigurationBuilder;

import discountcalculation.DiscountLogger.Level;

public class DiscountExecutor {

	private DiscountExecutor() {

	}

	protected static boolean execute(double MRP, CustomerContext context) {
		Reflections reflections = new Reflections(new ConfigurationBuilder().setUrls(ClasspathHelper.forPackage("*")) // Scan
																														// the
																														// specific
																														// package
				.setScanners(Scanners.SubTypes, Scanners.TypesAnnotated) // Scanners to use
		);

		Pattern pattern = Pattern.compile(".*Rule");

		Set<Class<? extends DiscountRule>> ruleClasses = reflections.getSubTypesOf(DiscountRule.class).stream()
				.filter(clazz -> pattern.matcher(clazz.getName()).matches())
				.collect(java.util.stream.Collectors.toSet());

		boolean result = true;
		for (Class<? extends DiscountRule> ruleClass : ruleClasses) {
			try {
				DiscountRule ruleInstance = ruleClass.getDeclaredConstructor().newInstance();
				boolean isApplicable = ruleInstance.isRuleApplicable(MRP, context);
				if (!isApplicable) {
					result = false;
					continue;
				}
			} catch (InstantiationException | IllegalAccessException | NoSuchMethodException
					| InvocationTargetException e) {
				DiscountLogger.log("Could not instantiate or execute method for class: " + ruleClass.getName(),
						Level.ERROR);
				result = false;
			}
		}
		return result;
	}

}

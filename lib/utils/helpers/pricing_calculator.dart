
class TPricingCalculator{
  // calculate price based on tax and shipping

  static double calculateTotalPrice(double produtPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = produtPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = produtPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  // calculate shipping cost

static String calculateShippingCost(double productPrice, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
}

// calculate tax

static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
}

static double getTaxRateForLocation(String location){
   // Lookup the tax rate for the given location from a tax rate database or api.

  // return the appropriate tax rate
    return 0.10; // example tax rate of 10%
}
static double getShippingCost(String location){
    // Lookup the shipping cost for the given location using a shipping rate ApI.
  // Calculate the shipping cost based on the various factors like distance , weight , etc.
    return 5.0;// example shipping cost of $5
}

}
/**
  * This program demonstrates the Abstract Classes &Inheritance.
  */
abstract class Employee {
    /** Stores the name. */
    String name;
    /** Stores the salary. */
    double basic;
    /** Stores the address. */
    String address;
    /** Constructor.
     */
    Employee() {
    }
    /** Constructor.
     * @param str passed to the constructor
     * @param sal pased to the constructor
     * @param addr passed to the constructor
     */
    Employee(String str, double sal, String addr) {
        name = str;
        basic = sal;
        address = addr;
    }
    /** Method.
     * displaying details
     */
    void show() {
        System.out.println("Name: \t\t\t" + name);
        System.out.println("Address: \t\t" + address);
        System.out.println("Basic: \t\t\t" + basic);
    }
    /** Abstract Method declaration.
     * @return double value
     * @param type is of char
     */
    abstract double totalPay();
    /** Method calculating Net pay.
     * Net Pay is calculated on the basis of leave
     * @return lesspay is of type double
     * @param leave is of type int
     */
    double deduction(int leave) {
      double lessPay;
      if (leave <= 5) {
         lessPay = (0.25 * basic);
      } else {
         lessPay = (0.5 * basic);
      }
      return lessPay;
    }
}
/**
  * This class is a subclass of Employee.
  */
class Manager extends Employee {
    /** Stores the department. */
    String department;
    /** Constructor.
     */
    Manager() {
    }
    Manager(String str, double sal, String addr, String dept) {
        super(str, sal, addr);
        department = dept;
    }
    /** Method calling the superclass method.
     * displaying details
     */
    void show() {
        super.show();
        System.out.println("Department: \t\t" + department);
    }
    /** Method calculating total pay.
     * Pay is calculated based on type of Employee
     * @return total
     * @param type is of char
     */
    double totalPay() {
       double totalAmount = 0;
             double houseRentAllowance = (basic * 0.08);
             double dearnessAllowance = (basic * 0.3);
             double medicalAllowance = 1500;
             totalAmount = basic + houseRentAllowance
             + dearnessAllowance + medicalAllowance;
         return totalAmount;
    }
}
/**
  * This class is a subclass of Manager.
  */
class Director extends Employee {
    /** Stores the transport allownance. */
    double transportAllowance;
    /** Constructor.
     */
    Director() {
    }
    Director(String str, double sal, String addr,
    double allowance) {
        super(str, sal, addr);
        transportAllowance = allowance;
    }
    /** Method using the 'super' keyword.
     * displaying details
     */
    void show() {
        super.show();
        //System.out.println("Transport Allowance: \t" + transportAllowance);
    }
    /** Method calculating total pay.
     * Pay is calculated based on type of Employee
     * @return total
     * @param type is of char
     */
   double totalPay() {
       double totalAmount = 0;
       double houseRentAllowance = (basic * 0.20);
       double dearnessAllowance = (basic * 0.5);
       double medicalAllowance = 4500;
       double entertainmentAllowance = 5000;
       totalAmount = basic + houseRentAllowance + dearnessAllowance
             + medicalAllowance + entertainmentAllowance + transportAllowance;
       return totalAmount;
    }
}
/**
  * This class tests the object references.
  */
class EmployeePay {
    /** Constructor.
     */
    EmployeePay() {
    }
     /**
      * This is the starting point of execution of any application.
      * @param args passed to the main method
      */
    public static void main(String[] args) {
       Manager mgrObj = new Manager("Henry", 5500.65, "Sydney", "Accounts");
       double payTotal = mgrObj.totalPay();
       double less = mgrObj.deduction(5);
       double netPay = payTotal - less;
       System.out.println("\nManager Details");
       System.out.println("===================================");
       mgrObj.show();
       System.out.println("Total Pay: \t\t" + payTotal);
       System.out.println("Net Pay: \t\t" + netPay);
       Director dirObj = new Director("Stephen", 32400.00, "New York",
       8000);
       payTotal = dirObj.totalPay();
       less = dirObj.deduction(5);
       netPay = payTotal - less;
       System.out.println("\n\nDirector Details");
       System.out.println("============================");
       dirObj.show();
       System.out.println("Total Pay: \t\t" + payTotal);
       System.out.println("Net Pay: \t\t" + netPay);
    }
}
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
	com.niit.HiberAnnotations.Employee,
	com.niit.HiberAnnotations.Address,
	javax.persistence.TypedQuery,
    org.hibernate.boot.Metadata,
    org.hibernate.boot.MetadataSources,
    org.hibernate.boot.registry.StandardServiceRegistry,
    org.hibernate.boot.registry.StandardServiceRegistryBuilder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory = cfg.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
		Session sessions = factory.openSession();
		Transaction tx = sessions.getTransaction();
		tx.begin();
		Employee e1 = new Employee();
		e1.setName("Ravi Kumar");
		e1.setEmail("ravi@gmail.com");

		Address address1 = new Address();
		address1.setAddressLine1("N-101,Indiranagar");
		address1.setCity("Bangalore");
		address1.setState("Karnataka");
		address1.setCountry("India");
		address1.setPincode(560042);

		e1.setAddress(address1);
		address1.setEmployee(e1);

		sessions.persist(e1);
		tx.commit();  
	        
	    TypedQuery query = sessions.createQuery("from Employee");
		List<Employee> list = query.getResultList();

		Iterator<Employee> itr = list.iterator();
		while (itr.hasNext()) {
			Employee emp = itr.next();
			out.println(emp.getEmployeeId() + " " + emp.getName() + " " + emp.getEmail() + "<br>");
			Address address = emp.getAddress();
			out.println(address.getAddressLine1() + " " + address.getCity() + " " + address.getState() + " "
					+ address.getCountry() + " " + address.getPincode());
		}
		sessions.close();
		out.println("successfully Saved");
	%>

</body>
</html>
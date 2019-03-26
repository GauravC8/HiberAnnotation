<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
com.niit.HiberAnnotations.Student,
com.niit.HiberAnnotations.Courses,
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

		Student s1 = new Student();
		s1.setStudentId(100);
		s1.setStudentName("James");
		s1.setMarks(98);

		Student s2 = new Student();
		s2.setStudentId(101);
		s2.setStudentName("Lee");
		s2.setMarks(99);

		Courses c1 = new Courses();
		c1.setCourseId(500);
		c1.setCourseName("Hibernate");
		c1.setDuration(7);

		Courses c2 = new Courses();
		c2.setCourseId(501);
		c2.setCourseName("Java");
		c2.setDuration(30);

		Set s = new HashSet();
		s.add(c1);
		s.add(c2);

		s1.setCourses(s);
		s2.setCourses(s);
		sessions.persist(s1);
		sessions.persist(s2);
		tx.commit();
		sessions.close();
	%>

</body>
</html>
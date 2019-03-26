<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
com.niit.HiberAnnotations.Answer,
com.niit.HiberAnnotations.Question,
javax.persistence.TypedQuery,
    org.hibernate.boot.Metadata,
    org.hibernate.boot.MetadataSources,
    org.hibernate.boot.registry.StandardServiceRegistry,
    org.hibernate.boot.registry.StandardServiceRegistryBuilder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Hibernate One -To Many Annotation Example</h2>
	<%
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory = cfg.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());

		Session sess = factory.openSession();
		Transaction tx = sess.getTransaction();
		tx.begin();
		
		
		Answer ans1 = new Answer();
		ans1.setAnswername("java is a Programming language");
		ans1.setPostedBy("varun Sharma");

		Answer ans2 = new Answer();
		ans2.setAnswername("java is a Platform");
		ans2.setPostedBy("Manmohan Singh");

		Answer ans3 = new Answer();
		ans3.setAnswername("Servlet is an Interface");
		ans3.setPostedBy("Jalebi Bai");

		Answer ans4 = new Answer();
		ans4.setAnswername("Servlet is an API");
		ans4.setPostedBy("Shakaal");

		ArrayList<Answer> list1 = new ArrayList<Answer>();
		list1.add(ans1);
		list1.add(ans2);

		ArrayList<Answer> list2 = new ArrayList<Answer>();
		list2.add(ans3);
		list2.add(ans4);

		Question ques1 = new Question();
		ques1.setQname("what is java?");
		ques1.setAnswers(list1);

		Question ques2 = new Question();
		ques2.setQname("what is servlet?");
		ques2.setAnswers(list2);

		sess.persist(ques1);
		sess.persist(ques2);

		tx.commit();

		out.println("Table CReated & Record successfully Inserted");
		/* factory.close(); */

		out.println("**********Display Data************");
		out.println("<br>");
		out.println("<br>");
		TypedQuery query = sess.createQuery("from Question");
		List<Question> list = query.getResultList();

		Iterator<Question> itr = list.iterator();
		while (itr.hasNext()) {
			Question q = itr.next();
			out.println("Question Name:  " + q.getQname());
			//printing answers

			List<Answer> list3 = q.getAnswers();
			Iterator<Answer> itr2 = list3.iterator();

			while (itr2.hasNext()) {
				Answer a = itr2.next();
				out.println(a.getAnswername() + ":" + a.getPostedBy());
			}

			out.println("<br>");
		}

		sess.close();
		
		System.out.println("Success");
	%>
</body>
</html>
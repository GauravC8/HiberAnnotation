package com.niit.HiberAnnotations;

import java.util.Set;

public class Courses {

	private int courseId;
	private String courseName;
	private int duration;
	private Set<Student> Student;
	public Set<Student> getStudent() {
		return Student;
	}
	public void setStudent(Set<Student> student) {
		Student = student;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}

}

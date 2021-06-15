package com.myProject.service;

import com.myProject.pojo.Student;

import java.util.List;

public interface StudentService {

    List<Student> findAll();

    List<Student> findOneByName(String name);

    void formInsert(Student student);

    void deleteStudent(Integer id);

    Student findOneById(Integer id);

    void updateById(Student student);
}

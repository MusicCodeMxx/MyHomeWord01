package com.myProject.mapper;

import com.myProject.pojo.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentMapper {
    List<Student> findAll();

    List<Student> findOneByName(String name);

    void formInsert(Student student);

    void deleteStudent(Integer id);

    Student findOneById(Integer id);

    void updateById(Student student);
}

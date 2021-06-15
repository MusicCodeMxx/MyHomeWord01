package com.myProject.service.impl;

import com.myProject.mapper.StudentMapper;
import com.myProject.pojo.Student;
import com.myProject.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    StudentMapper studentMapper;


    @Override
    public List<Student> findAll() {
        return studentMapper.findAll();
    }

    @Override
    public List<Student> findOneByName(String name) {
        return studentMapper.findOneByName(name);
    }

    @Override
    public void formInsert(Student student) {
        studentMapper.formInsert(student);
    }

    @Override
    public void deleteStudent(Integer id) {
        studentMapper.deleteStudent(id);
    }

    @Override
    public Student findOneById(Integer id) {
        return studentMapper.findOneById(id);
    }

    @Override
    public void updateById(Student student) {
        studentMapper.updateById(student);
    }
}

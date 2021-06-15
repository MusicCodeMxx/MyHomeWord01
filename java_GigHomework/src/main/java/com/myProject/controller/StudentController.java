package com.myProject.controller;

import com.myProject.pojo.Student;
import com.myProject.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class StudentController {

    @Autowired
    StudentService studentService;

    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView modelAndView = new ModelAndView();
        List<Student> studentList = studentService.findAll();
        modelAndView.setViewName("studentList.jsp");
        modelAndView.addObject("studentList",studentList);
        return modelAndView;
    }


    @RequestMapping("/findOneByName")
    public ModelAndView findOneByName(String name){
        ModelAndView modelAndView = new ModelAndView();
        List<Student> studentList = studentService.findOneByName(name);
        modelAndView.setViewName("studentList.jsp");
        modelAndView.addObject("studentList",studentList);
        return modelAndView;
    }

    @RequestMapping("/formInsert")
    public ModelAndView formInsert(Student student){
        ModelAndView modelAndView = new ModelAndView();
        studentService.formInsert(student);
        modelAndView.setViewName("/findAll");
        return modelAndView;
    }

    @RequestMapping("/deleteStudent")
    public ModelAndView deleteStudent(Integer id){
        ModelAndView modelAndView = new ModelAndView();
        studentService.deleteStudent(id);
        modelAndView.setViewName("/findAll");
        return modelAndView;
    }

    @RequestMapping("/updateUserStudent")
    public ModelAndView updateUserStudent(Integer id){
        ModelAndView modelAndView = new ModelAndView();
        Student student = studentService.findOneById(id);
        modelAndView.addObject("student",student);
        modelAndView.setViewName("updateStudent.jsp");
        return modelAndView;
    }

    @RequestMapping("/updateById")
    public ModelAndView updateById(Student student){
        ModelAndView modelAndView = new ModelAndView();
        studentService.updateById(student);
        modelAndView.setViewName("/findAll");
        return modelAndView;
    }

}

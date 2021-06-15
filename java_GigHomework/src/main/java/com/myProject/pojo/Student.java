package com.myProject.pojo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Student {
    private Integer id;
    //姓名
    private String name;
    //学号
    private String number;
    //性别
    private String gender;
    //电话
    private String phone;
}

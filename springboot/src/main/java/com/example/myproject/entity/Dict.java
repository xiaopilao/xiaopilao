package com.example.myproject.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("t_dict")
@Data
public class Dict {

    private String name;
    private String value;
    private String type;

}

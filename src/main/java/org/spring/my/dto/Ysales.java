package org.spring.my.dto;

import lombok.Data;

@Data
public class Ysales {
    private int salenum;
    private String userid;
    private int clsnum;
    private int cnt;
    private int amount;
    private String regdate;
    
    //조인된 Yclass정보
    private String clsname;
    private String clsdate;
    private String clstime;
    private int clsprice;
    
    //조인된 Ymember정보
    private String name;
}

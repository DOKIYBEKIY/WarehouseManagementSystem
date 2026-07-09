package com.wms.entity;


import java.math.BigDecimal;
import java.util.Date;


public class Goods {


    private Integer goodsId;


    private String goodsCode;


    private String goodsName;


    private Integer categoryId;


    private String specification;


    private String unit;


    private BigDecimal price;


    private Integer status;


    private Date createTime;


    private Date updateTime;


    /*
     * 分类名称
     * 用于页面显示
     */
    private String categoryName;



    public Integer getGoodsId() {
        return goodsId;
    }


    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }


    public String getGoodsCode() {
        return goodsCode;
    }


    public void setGoodsCode(String goodsCode) {
        this.goodsCode = goodsCode;
    }


    public String getGoodsName() {
        return goodsName;
    }


    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }


    public Integer getCategoryId() {
        return categoryId;
    }


    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }


    public String getSpecification() {
        return specification;
    }


    public void setSpecification(String specification) {
        this.specification = specification;
    }


    public String getUnit() {
        return unit;
    }


    public void setUnit(String unit) {
        this.unit = unit;
    }


    public BigDecimal getPrice() {
        return price;
    }


    public void setPrice(BigDecimal price) {
        this.price = price;
    }


    public Integer getStatus() {
        return status;
    }


    public void setStatus(Integer status) {
        this.status = status;
    }


    public Date getCreateTime() {
        return createTime;
    }


    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    public Date getUpdateTime() {
        return updateTime;
    }


    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }


    public String getCategoryName() {
        return categoryName;
    }


    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

}
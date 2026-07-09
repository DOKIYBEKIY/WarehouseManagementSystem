package com.wms.entity;


import java.util.Date;


public class Warehouse {


    private Integer warehouseId;


    private String warehouseCode;


    private String warehouseName;


    private String location;


    private Double capacity;


    private String managerName;


    private String remark;


    private Integer status;


    private Date createTime;


    private Date updateTime;



    public Integer getWarehouseId() {
        return warehouseId;
    }


    public void setWarehouseId(Integer warehouseId) {
        this.warehouseId = warehouseId;
    }



    public String getWarehouseCode() {
        return warehouseCode;
    }


    public void setWarehouseCode(String warehouseCode) {
        this.warehouseCode = warehouseCode;
    }



    public String getWarehouseName() {
        return warehouseName;
    }


    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }



    public String getLocation() {
        return location;
    }


    public void setLocation(String location) {
        this.location = location;
    }



    public Double getCapacity() {
        return capacity;
    }


    public void setCapacity(Double capacity) {
        this.capacity = capacity;
    }



    public String getManagerName() {
        return managerName;
    }


    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }



    public String getRemark() {
        return remark;
    }


    public void setRemark(String remark) {
        this.remark = remark;
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

}
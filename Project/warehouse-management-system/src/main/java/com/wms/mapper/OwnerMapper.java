package com.wms.mapper;

import com.wms.entity.Owner;
import java.util.List;

public interface OwnerMapper {
    List<Owner> findAll();
    Owner findById(Integer id);
    int add(Owner owner);
    int update(Owner owner);
    int delete(Integer id);

    int updateStatus(Integer id, Integer status);
}

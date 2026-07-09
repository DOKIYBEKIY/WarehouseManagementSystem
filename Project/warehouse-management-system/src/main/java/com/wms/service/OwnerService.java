package com.wms.service;

import com.wms.entity.Owner;
import java.util.List;

public interface OwnerService {
    List<Owner> findAll();
    Owner findById(Integer id);
    void add(Owner owner);
    void update(Owner owner);
    void delete(Integer id);
}

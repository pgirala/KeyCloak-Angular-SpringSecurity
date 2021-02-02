package com.pj.keycloak.service;

import com.pj.keycloak.model.Department;

import com.pj.keycloak.util.UserInfoUtil;

import java.util.List;
import java.util.Optional;

//import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreAuthorize;

public interface DepartmentService {
    @PostFilter("hasPermission(filterObject, 'READ')")
    List<Department> findAll();

    @PreAuthorize("hasPermission(#id,'com.pj.keycloak.model.Department', 'READ')")
    Optional<Department> findById(Long id);

    @PreAuthorize("hasPermission(#department, 'WRITE')")
    Department updateProfile(Department department);

    @PreAuthorize("hasPermission(#department, 'CREATE')")
    Department saveAndFlush(Department department, UserInfoUtil userInfoUtil);

    @PreAuthorize("hasPermission(#id,'com.pj.keycloak.model.Department', 'DELETE')")
    void deleteById(Long id);
}

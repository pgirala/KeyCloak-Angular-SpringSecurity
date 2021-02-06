package com.pj.keycloak.service;

import com.pj.keycloak.model.Employee;

import com.pj.keycloak.util.UserInfoUtil;

import java.util.List;
import java.util.Optional;

//import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreAuthorize;

public interface EmployeeService {
    @PostFilter("hasPermission(filterObject, 'READ')")
    List<Employee> findAll();

    @PreAuthorize("hasPermission(#id,'com.pj.keycloak.model.Employee', 'READ')")
    Optional<Employee> findById(Long id);

    @PreAuthorize("hasPermission(#employee, 'WRITE')")
    Employee updateProfile(Employee employee);

    @PreAuthorize("hasPermission(#employee, 'CREATE')")
    Employee saveAndFlush(Employee employee, UserInfoUtil userInfoUtil);

    @PreAuthorize("hasPermission(#id,'com.pj.keycloak.model.Employee', 'DELETE')")
    void deleteById(Long id);
}

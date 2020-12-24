package com.pj.keycloak.service;

import com.pj.keycloak.model.Employee;

import java.util.List;
import java.util.Optional;

public interface EmployeeService
{
    List<Employee> findAll();

    Optional<Employee> findById(Long id);

    Employee updateProfile(Employee employee);

    void saveAndFlush(Employee employee);

    void deleteById(Long id);
}

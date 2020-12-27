package com.pj.keycloak.repo;

import com.pj.keycloak.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

import org.javers.spring.annotation.JaversSpringDataAuditable;

@JaversSpringDataAuditable
public interface EmployeeRepository extends JpaRepository<Employee,Long>
{
}

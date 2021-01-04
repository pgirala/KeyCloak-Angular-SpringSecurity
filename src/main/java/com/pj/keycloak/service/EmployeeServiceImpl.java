package com.pj.keycloak.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.pj.keycloak.model.Employee;
import com.pj.keycloak.repo.EmployeeRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Optional;

import org.springframework.security.acls.jdbc.JdbcMutableAclService;
import org.springframework.security.acls.model.Acl;
import org.springframework.security.acls.model.MutableAcl;
import org.springframework.security.acls.model.ObjectIdentity;
import org.springframework.security.acls.domain.ObjectIdentityImpl;
import org.springframework.security.acls.domain.BasePermission;
import org.springframework.security.acls.domain.PrincipalSid;
import org.springframework.security.acls.domain.GrantedAuthoritySid;

import com.pj.keycloak.util.UserInfoUtil;

@Service
public class EmployeeServiceImpl implements EmployeeService
{
    @Autowired
    private JdbcMutableAclService aclService;

    private final EmployeeRepository employeeRepository;

    public EmployeeServiceImpl(EmployeeRepository employeeRepository)
    {
        this.employeeRepository = employeeRepository;
    }

    @Override
    public List<Employee> findAll()
    {
        return employeeRepository.findAll();
    }

    @Override
    public Optional<Employee> findById(Long id)
    {
        return employeeRepository.findById(id);
    }

    @Override
    public Employee updateProfile(Employee employee)
    {
        return employeeRepository.saveAndFlush(employee);
    }

    @Override
    public void saveAndFlush(Employee employee, UserInfoUtil userInfoUtil)
    {
        Employee newEmployee = employeeRepository.saveAndFlush(employee);
        ObjectIdentity objectIdentity = new ObjectIdentityImpl(newEmployee.getClass().getName(), employee.getId());
        MutableAcl mutableAcl = aclService.createAcl(objectIdentity);
        // Now let's add a couple of permissions
        int i = 0;

        for(String rol : userInfoUtil.getRoles()) {
            mutableAcl.insertAce(i++, BasePermission.READ, new GrantedAuthoritySid(rol), true);
            mutableAcl.insertAce(i++, BasePermission.WRITE, new GrantedAuthoritySid(rol), true);
            mutableAcl.insertAce(i++, BasePermission.DELETE, new GrantedAuthoritySid(rol), true);
            mutableAcl.insertAce(i++, BasePermission.CREATE, new GrantedAuthoritySid(rol), true);
       }
       
		// Explicitly save the changed ACL
		aclService.updateAcl(mutableAcl);   
    }

    @Override
    public void deleteById(Long id)
    {
        employeeRepository.deleteById(id);
        ObjectIdentity objectIdentity = new ObjectIdentityImpl(Employee.class.getName(), id);
        aclService.deleteAcl(objectIdentity, true);
     }
}

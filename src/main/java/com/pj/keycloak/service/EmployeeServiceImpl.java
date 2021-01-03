package com.pj.keycloak.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.pj.keycloak.model.Employee;
import com.pj.keycloak.repo.EmployeeRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.security.acls.jdbc.JdbcMutableAclService;
import org.springframework.security.acls.model.MutableAcl;
import org.springframework.security.acls.model.ObjectIdentity;
import org.springframework.security.acls.domain.ObjectIdentityImpl;
import org.springframework.security.acls.domain.BasePermission;
import org.springframework.security.acls.domain.PrincipalSid;

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
		mutableAcl.insertAce(0, BasePermission.READ, new PrincipalSid(userInfoUtil.getAuthority()), true);
		mutableAcl.insertAce(1, BasePermission.WRITE, new PrincipalSid(userInfoUtil.getAuthority()), false);
		mutableAcl.insertAce(2, BasePermission.DELETE, new PrincipalSid(userInfoUtil.getAuthority()), true);
		// Explicitly save the changed ACL
		aclService.updateAcl(mutableAcl);   
    }

    @Override
    public void deleteById(Long id, UserInfoUtil userInfoUtil)
    {
        employeeRepository.deleteById(id);
        ObjectIdentity objectIdentity = new ObjectIdentityImpl(Employee.class.getName(), id);
        List<ObjectIdentity> objectIdentityList = new List<ObjectIdentity>();
        objectIdentityList.add(objectIdentity);
        //MutableAcl mutableAcl = aclService.readAclsById(objectIdentityList);
        //mutableAcl.deleteAce();
    }
}

package com.pj.keycloak.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.pj.keycloak.model.Department;
import com.pj.keycloak.model.Employee;
import com.pj.keycloak.repo.DepartmentRepository;
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
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private JdbcMutableAclService aclService;

    private final DepartmentRepository departmentRepository;
    private final EmployeeRepository employeeRepository;

    public DepartmentServiceImpl(DepartmentRepository departmentRepository, EmployeeRepository employeeRepository) {
        this.departmentRepository = departmentRepository;
        this.employeeRepository = employeeRepository;
    }

    @Override
    public List<Department> findAll() {
        return departmentRepository.findAll();
    }

    @Override
    public Optional<Department> findById(Long id) {
        return departmentRepository.findById(id);
    }

    @Override
    public Department updateProfile(Department department) {
        Department updatedDepartment = departmentRepository.saveAndFlush(department);

        for (Employee employee : department.getEmployees())
            if (this.employeeRepository.findById(employee.getId()).isPresent()) {
                Employee reasignedEmployee = this.employeeRepository.findById(employee.getId()).get();
                reasignedEmployee.setDepartment(updatedDepartment);
                this.employeeRepository.saveAndFlush(reasignedEmployee);
            }

        return updatedDepartment;
    }

    @Override
    public Department saveAndFlush(Department department, UserInfoUtil userInfoUtil) {
        department.setId(null); // restablece el id tras aplicar el permiso CREATE en la ACL
        Department newDepartment = departmentRepository.saveAndFlush(department);

        for (Employee employee : department.getEmployees())
            if (this.employeeRepository.findById(employee.getId()).isPresent()) {
                Employee reasignedEmployee = this.employeeRepository.findById(employee.getId()).get();
                reasignedEmployee.setDepartment(newDepartment);
                this.employeeRepository.saveAndFlush(reasignedEmployee);
            }

        // access control
        ObjectIdentity objectIdentity = new ObjectIdentityImpl(newDepartment.getClass().getName(), department.getId());
        MutableAcl mutableAcl = aclService.createAcl(objectIdentity);
        // Now let's add a couple of permissions
        int i = 0;

        for (String rol : userInfoUtil.getRoles()) {
            mutableAcl.insertAce(i++, BasePermission.READ, new GrantedAuthoritySid(rol), true);
            mutableAcl.insertAce(i++, BasePermission.WRITE, new GrantedAuthoritySid(rol), true);
            mutableAcl.insertAce(i++, BasePermission.DELETE, new GrantedAuthoritySid(rol), true);
        }

        // Explicitly save the changed ACL
        aclService.updateAcl(mutableAcl);

        return newDepartment;
    }

    @Override
    public void deleteById(Long id) {
        Optional<Department> department = departmentRepository.findById(id);
        if (!department.isEmpty()) {
            departmentRepository.deleteById(id);
            if (!department.isEmpty()) {
                Department departent2delete = department.get();
                for (Employee employee : departent2delete.getEmployees())
                    if (this.employeeRepository.findById(employee.getId()).isPresent()) {
                        Employee reasignedEmployee = this.employeeRepository.findById(employee.getId()).get();
                        reasignedEmployee.setDepartment(null);
                        this.employeeRepository.saveAndFlush(reasignedEmployee);
                    }
            }
            // deleting ACL
            ObjectIdentity objectIdentity = new ObjectIdentityImpl(Department.class.getName(), id);
            aclService.deleteAcl(objectIdentity, true);
        }
    }
}

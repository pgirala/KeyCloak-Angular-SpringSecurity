package com.pj.keycloak.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.pj.keycloak.model.Project;
import com.pj.keycloak.model.Employee;
import com.pj.keycloak.repo.ProjectRepository;
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
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private JdbcMutableAclService aclService;

    private final ProjectRepository projectRepository;
    private final EmployeeRepository employeeRepository;

    public ProjectServiceImpl(ProjectRepository projectRepository, EmployeeRepository employeeRepository) {
        this.projectRepository = projectRepository;
        this.employeeRepository = employeeRepository;
    }

    @Override
    public List<Project> findAll() {
        return projectRepository.findAll();
    }

    @Override
    public Optional<Project> findById(Long id) {
        return projectRepository.findById(id);
    }

    @Override
    public Project updateProfile(Project project) {
        return projectRepository.saveAndFlush(project);
    }

    @Override
    public Project saveAndFlush(Project project, UserInfoUtil userInfoUtil) {
        project.setId(null); // restablece el id tras aplicar el permiso CREATE en la ACL
        Project newProject = projectRepository.saveAndFlush(project);
        // setting relationships
        for (Employee employee : project.getEmployees()) {
            Optional<Employee> persistentEmployee = employeeRepository.findById(employee.getId());
            if (!persistentEmployee.isEmpty()) {
                Employee relatedEmployee = persistentEmployee.get();
                relatedEmployee.getProjects().add(newProject);
                employeeRepository.saveAndFlush(relatedEmployee);
            }
        }
        // access control
        ObjectIdentity objectIdentity = new ObjectIdentityImpl(newProject.getClass().getName(), project.getId());
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

        return newProject;
    }

    @Override
    public void deleteById(Long id) {
        projectRepository.deleteById(id);
        ObjectIdentity objectIdentity = new ObjectIdentityImpl(Project.class.getName(), id);
        aclService.deleteAcl(objectIdentity, true);
    }
}

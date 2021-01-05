package com.pj.keycloak.service;

import com.pj.keycloak.model.Project;

import com.pj.keycloak.util.UserInfoUtil;

import java.util.List;
import java.util.Optional;

//import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ProjectService
{
    @PostFilter("hasPermission(filterObject, 'READ')")
    List<Project> findAll();

    @PreAuthorize("hasPermission(#id,'com.pj.keycloak.model.Project', 'READ')")
    Optional<Project> findById(Long id);

    @PreAuthorize("hasPermission(#project, 'WRITE')")
    Project updateProfile(Project project);

    @PreAuthorize("hasPermission(#project, 'CREATE')")
    void saveAndFlush(Project project, UserInfoUtil userInfoUtil);

    @PreAuthorize("hasPermission(#id,'com.pj.keycloak.model.Project', 'DELETE')")
    void deleteById(Long id);
}

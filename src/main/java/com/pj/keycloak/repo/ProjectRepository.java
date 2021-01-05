package com.pj.keycloak.repo;

import com.pj.keycloak.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import org.javers.spring.annotation.JaversSpringDataAuditable;

@JaversSpringDataAuditable
public interface ProjectRepository extends JpaRepository<Project,Long>
{
}

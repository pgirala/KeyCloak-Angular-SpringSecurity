package com.pj.keycloak.web;

import com.pj.keycloak.model.Project;
import com.pj.keycloak.service.ProjectService;
import com.pj.keycloak.util.UserInfoUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@RestController
@RequestMapping("/api/v1/project")
public class ProjectController
{
    private final ProjectService projectService;
    private final UserInfoUtil userInfoUtil;

    private Logger logger= LoggerFactory.getLogger(ProjectController.class);


    public ProjectController(ProjectService projectService, UserInfoUtil userInfoUtil)
    {
        this.projectService = projectService;
        this.userInfoUtil = userInfoUtil;
    }

    @GetMapping(path = "/list")
    public List<Project> findAll(HttpServletRequest httpServletRequest)
    {
        logger.info("User Id: {}",userInfoUtil.getPreferredUsername(httpServletRequest));
        return projectService.findAll();
    }

    @GetMapping(path = "/find/{id}")
    public Optional<Project> findById(@PathVariable Long id)
    {
        return projectService.findById(id);
    }

    @PostMapping(path = "/update")
    public Project update(@RequestBody Project project)
    {
        return projectService.updateProfile(project);
    }

    @PostMapping(path = "/create")
    public List<Project> create(@RequestBody Project project)
    {
        project.setId(Project.getIdClase()); // para aplicar el permiso CREATE en la ACL
        project.setName("(Nombre del proyecto)");
        project.setLocation("(Ubicación)");
        project.setBudget(0.0);
        projectService.saveAndFlush(project, userInfoUtil);

        return projectService.findAll();
    }

    @DeleteMapping(path = "/delete/{id}")
    public void deleteProject(@PathVariable Long id)
    {
        projectService.deleteById(id);
    }

}

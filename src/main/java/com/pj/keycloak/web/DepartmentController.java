package com.pj.keycloak.web;

import com.pj.keycloak.model.Department;
import com.pj.keycloak.service.DepartmentService;
import com.pj.keycloak.util.UserInfoUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.DELETE,
        RequestMethod.PUT })
@RequestMapping("/api/v1/department")
public class DepartmentController {
    private final DepartmentService departmentService;
    private final UserInfoUtil userInfoUtil;

    private Logger logger = LoggerFactory.getLogger(DepartmentController.class);

    public DepartmentController(DepartmentService departmentService, UserInfoUtil userInfoUtil) {
        this.departmentService = departmentService;
        this.userInfoUtil = userInfoUtil;
    }

    @GetMapping(path = "/list")
    public List<Department> findAll(HttpServletRequest httpServletRequest) {
        logger.info("User Id: {}", userInfoUtil.getPreferredUsername(httpServletRequest));
        return departmentService.findAll();
    }

    @GetMapping(path = "/find/{id}")
    public Optional<Department> findById(@PathVariable Long id) {
        return departmentService.findById(id);
    }

    @PostMapping(path = "/update")
    public Department update(@RequestBody Department department) {
        return departmentService.updateProfile(department);
    }

    @PostMapping(path = "/create")
    public Department create(@RequestBody Department department) {
        department.setId(Department.getIdClase()); // para aplicar el permiso CREATE en la ACL
        return departmentService.saveAndFlush(department, userInfoUtil);
    }

    @DeleteMapping(path = "/delete/{id}")
    public void deleteDepartment(@PathVariable Long id) {
        departmentService.deleteById(id);
    }

}

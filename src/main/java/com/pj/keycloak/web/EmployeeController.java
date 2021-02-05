package com.pj.keycloak.web;

import com.pj.keycloak.model.Employee;
import com.pj.keycloak.service.EmployeeService;
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
@RequestMapping("/api/v1/employee")
public class EmployeeController {
    private final EmployeeService employeeService;
    private final UserInfoUtil userInfoUtil;

    private Logger logger = LoggerFactory.getLogger(EmployeeController.class);

    public EmployeeController(EmployeeService employeeService, UserInfoUtil userInfoUtil) {
        this.employeeService = employeeService;
        this.userInfoUtil = userInfoUtil;
    }

    @GetMapping(path = "/list")
    public List<Employee> findAll(HttpServletRequest httpServletRequest) {
        logger.info("User Id: {}", userInfoUtil.getPreferredUsername(httpServletRequest));
        return employeeService.findAll();
    }

    @GetMapping(path = "/find/{id}")
    public Optional<Employee> findById(@PathVariable Long id) {
        return employeeService.findById(id);
    }

    @PostMapping(path = "/update")
    public Employee update(@RequestBody Employee employee) {
        employee.setUserGuid(userInfoUtil.getUserGuid());
        return employeeService.updateProfile(employee);
    }

    @PostMapping(path = "/create")
    public Employee create(@RequestBody Employee employee) {
        employee.setId(Employee.getIdClase()); // para aplicar el permiso CREATE en la ACL
        return employeeService.saveAndFlush(employee, userInfoUtil);
    }

    @DeleteMapping(path = "/delete/{id}")
    public void deleteEmployee(@PathVariable Long id) {
        employeeService.deleteById(id);
    }
}

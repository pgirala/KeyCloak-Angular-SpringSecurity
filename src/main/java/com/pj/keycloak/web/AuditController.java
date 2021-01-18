package com.pj.keycloak.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import org.javers.core.Javers;
import org.javers.repository.jql.QueryBuilder;
import org.javers.core.diff.Change;

@RestController
@CrossOrigin(origins = "*", methods= {RequestMethod.GET})
@RequestMapping("/api/v1/audit")
public class AuditController
{
    private final Javers javers;

    private Logger logger= LoggerFactory.getLogger(AuditController.class);


    public AuditController(Javers javers)
    {
        this.javers = javers;
    }

    @GetMapping(path = "/employee/{id}")
    public String getEmployeeChanges(@PathVariable Long id)
    {
        logger.info("Consulta de cambios del empleado Id: {}",id);
        QueryBuilder jqlQuery = QueryBuilder.byInstanceId(id, "com.pj.keycloak.model.Employee");

        List<Change> changes = javers.findChanges(jqlQuery.build());

        return javers.getJsonConverter().toJson(changes);
    }
}

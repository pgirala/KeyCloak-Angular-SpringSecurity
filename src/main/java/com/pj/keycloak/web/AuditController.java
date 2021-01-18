package com.pj.keycloak.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.ArrayList;

import org.javers.core.Javers;
import org.javers.repository.jql.QueryBuilder;
import org.javers.core.diff.Change;
import org.javers.core.diff.changetype.ValueChange;

import lombok.Data;

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
    public String getViewEmployeeChanges(@PathVariable Long id)
    {
        logger.info("Consulta de cambios del empleado Id: {}",id);
        List<ChangeView>result = new ArrayList<ChangeView>();
        for (Change change: getEmployeeChanges(id)) {
            if (change instanceof ValueChange) {
                ValueChange valueChange = (ValueChange)change;
                result.add(new ChangeView(valueChange.getCommitMetadata().get().getAuthor(),
                                            valueChange.getCommitMetadata().get().getCommitDate().toString(),
                                            valueChange.getChangeType().toString(), 
                                            valueChange.getPropertyName().toString(),
                                            valueChange.getLeft().toString(),
                                            valueChange.getRight().toString()));
            }
        }
        return javers.getJsonConverter().toJson(result);
    }

    private List<Change> getEmployeeChanges(Long id) {
        QueryBuilder jqlQuery = QueryBuilder.byInstanceId(id, "com.pj.keycloak.model.Employee");
        return javers.findChanges(jqlQuery.build());
    }

}

@Data
final class ChangeView {
    private String author;
    private String date;
    private String type;
    private String property;
    private String from;
    private String to;

    ChangeView(String author,
                String date,
                String type,
                String property,
                String from,
                String to) {
        this.author = author;
        this.date = date;
        this.type = type;
        this.property = property;
        this.from = from;
        this.to = to;
    }
}

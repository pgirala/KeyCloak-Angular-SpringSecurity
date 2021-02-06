package com.pj.keycloak.model;

import lombok.Data;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "employee")
@Data
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Employee implements Serializable {
    private static final long serialVersionUID = -2482579485413606056L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "employee_id")
    private Long employeeId;

    @Column(name = "location")
    private String location;

    @Column(name = "salary")
    private Double salary;

    @ManyToOne
    @JoinColumn(name = "department_id", nullable = true)
    // @JsonManagedReference
    private Department department;

    @ManyToMany(mappedBy = "employees")
    @JsonBackReference
    private Set<Project> projects = new HashSet<>();

    public static Long getIdClase() {
        // permitirá aplicar el control sobre la creación de instancias en las ACL
        return Employee.serialVersionUID;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        if (!super.equals(o))
            return false;
        Employee employee = (Employee) o;
        return this.getId().equals(employee.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), this.getId());
    }
}

package com.pj.keycloak.model;

import lombok.Data;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.Objects;

@Entity
@Table(name = "department")
@Data
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Department implements Serializable {
    private static final long serialVersionUID = -2482579485413606055L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "department")
    // @JsonManagedReference
    private Set<Employee> employees = new HashSet<>();

    public static Long getIdClase() {
        // permitirá aplicar el control sobre la creación de instancias en las ACL
        return Department.serialVersionUID;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        if (!super.equals(o))
            return false;
        Department department = (Department) o;
        return getId().equals(department.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), this.getId());
    }
}

package com.pj.keycloak.security;

import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;

public class Roles
{
    static public final String ROLE_ADMIN ="ROLE_ADMIN";
    static public final String ROLE_GESTOR="ROLE_GESTOR";
    static public final List<String>ROL_LIST=new ArrayList<String>(
        Arrays.asList(ROLE_ADMIN, ROLE_GESTOR)
    );

    private Roles()
    {

    }
}
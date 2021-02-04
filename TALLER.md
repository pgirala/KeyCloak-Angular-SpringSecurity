# Pasos a seguir para el taller demostración de la integración de form.io

Objetivo: CRUDi de departamentos. Un departamente tiene adscrito a varios empleados pero un empleado solo puede estar adscrito a un departamento.
Etapas:

Backend (API REST)

- Actualización del esquema de la base de datos.
  Se crea la tabla department y el campo department_id y la FK en employee.

- Asignación de permisos al recurso correspondiente al CRUD.
- Configuración de los datos necesarios para la ACL de departamentos.
- Componente: lista de departamentos (esta parte puede saltarse en el taller).
  Frontend
- Diseño del formulario.
- Componente: detalle de departamento.

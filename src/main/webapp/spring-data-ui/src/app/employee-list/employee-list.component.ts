import {Component, OnInit} from "@angular/core";
import {Router} from "@angular/router";
import {NgxSpinnerService} from "ngx-spinner";
import {KeycloakService} from "../keycloak/keycloak.service";
import {Employee} from "./employee";
import {EmployeeService} from "./employee.service";

@Component({
  selector: 'app-employee-list',
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.css']
})
export class EmployeeListComponent implements OnInit
{
  employees: Array<Employee>;

  constructor(private employeeService:EmployeeService,
              private keycloakService:KeycloakService,
              private ngxSpinnerService:NgxSpinnerService,
              private router:Router)
  { }

  ngOnInit()
  {
    this.getEmployees();
  }

  private getEmployees()
  {
    this.ngxSpinnerService.show();
    this.employeeService.getEmployees('http://localhost:8010/proxy/api/v1/employee/list').subscribe(
      data=>
      {
        this.employees=data;
        this.ngxSpinnerService.hide();
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );
  }


  logout()
  {
    this.keycloakService.logout();
  }

  createEmployee()
  {
    this.ngxSpinnerService.show();
    let employee=new Employee();
    employee.employeeId=1001;
    employee.location='(location)';
    employee.salary=0.0;
    employee.email='(email)';
    employee.firstName='(name)';
    employee.lastName='(surname)';
    employee.phone='(phone)';


    this.employeeService.createEmployee('http://localhost:8010/proxy/api/v1/employee/create',employee).subscribe(
      data=>
      {
        this.employees=data;
        this.ngxSpinnerService.hide();
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );
  }

  deleteEmployee(id: number)
  {
    this.employeeService.deleteEmployee('http://localhost:8010/proxy/api/v1/employee/delete/'+id).subscribe(
      data=>
      {
        this.getEmployees();
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );
  }

  editEmployee(id: number)
  {
    this.router.navigate(["/employee/" + id, { editMode: true }
    ]);
  }
}

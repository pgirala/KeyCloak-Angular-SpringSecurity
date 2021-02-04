import {Component, OnInit} from "@angular/core";
import {Router} from "@angular/router";
import {NgxSpinnerService} from "ngx-spinner";
import {KeycloakService} from "../keycloak/keycloak.service";
import {Department} from "./department";
import {DepartmentService} from "./department.service";

@Component({
  selector: 'app-employee-list',
  templateUrl: './department-list.component.html',
  styleUrls: ['./department-list.component.css']
})
export class DepartmentListComponent implements OnInit
{
  departments: Array<Department>;

  constructor(private departmentService:DepartmentService,
              private keycloakService:KeycloakService,
              private ngxSpinnerService:NgxSpinnerService,
              private router:Router)
  { }

  ngOnInit()
  {
    this.getDepartments();
  }

  private getDepartments()
  {
    this.ngxSpinnerService.show();
    this.departmentService.getDepartments('http://localhost:8010/proxy/api/v1/department/list').subscribe(
      data=>
      {
        this.departments=data;
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

  createDepartment()
  {
    this.router.navigate(["/department"], { queryParams: { editMode: 'true' } });
  }

  deleteDepartment(id: number)
  {
    this.departmentService.deleteDepartment('http://localhost:8010/proxy/api/v1/department/delete/'+id).subscribe(
      data=>
      {
        this.getDepartments();
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );
  }

  editDepartment(id: number)
  {
    this.router.navigate(["/department/" + id], { queryParams: { editMode: 'true' } });
  }
}

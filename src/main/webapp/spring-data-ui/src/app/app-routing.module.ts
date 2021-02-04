import {NgModule} from "@angular/core";
import {RouterModule, Routes} from "@angular/router";
import {EmployeeViewComponent} from "src/app/employee-view/employee-view.component";
import {EmployeeListComponent} from "./employee-list/employee-list.component";
import {EmployeeProjectComponent} from "./employee-project/employee-project.component";
import {ProjectViewComponent} from "src/app/project-view/project-view.component";
import {ProjectListComponent} from "./project-list/project-list.component";
import {DepartmentViewComponent} from "src/app/department-view/department-view.component";
import {DepartmentListComponent} from "./department-list/department-list.component";
import {LogoutComponent} from "./logout/logout.component";

const routes: Routes = [
  {
    path: 'employee/list',
    component: EmployeeListComponent
  },
  {
    path: 'employee/:id',
    component: EmployeeViewComponent
  },
  {
    path: 'employee_project/list',
    component: EmployeeProjectComponent
  },
  {
    path: 'project/list',
    component: ProjectListComponent
  },
  {
    path: 'project/:id',
    component: ProjectViewComponent
  },
  {
    path: 'project',
    component: ProjectViewComponent
  },
  {
    path: 'department/list',
    component: DepartmentListComponent
  },
  {
    path: 'department/:id',
    component: DepartmentViewComponent
  },
  {
    path: 'department',
    component: DepartmentViewComponent
  },
  {
    path: 'logout',
    component:LogoutComponent
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {

}

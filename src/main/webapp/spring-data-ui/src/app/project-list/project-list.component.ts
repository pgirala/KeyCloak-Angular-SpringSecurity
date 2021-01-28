import {Component, OnInit} from "@angular/core";
import {Router} from "@angular/router";
import {NgxSpinnerService} from "ngx-spinner";
import {KeycloakService} from "../keycloak/keycloak.service";
import {Project} from "./project";
import {ProjectService} from "./project.service";

@Component({
  selector: 'app-employee-list',
  templateUrl: './project-list.component.html',
  styleUrls: ['./project-list.component.css']
})
export class ProjectListComponent implements OnInit
{
  projects: Array<Project>;

  constructor(private projectService:ProjectService,
              private keycloakService:KeycloakService,
              private ngxSpinnerService:NgxSpinnerService,
              private router:Router)
  { }

  ngOnInit()
  {
    this.getProjects();
  }

  private getProjects()
  {
    this.ngxSpinnerService.show();
    this.projectService.getProjects('http://localhost:8010/proxy/api/v1/project/list').subscribe(
      data=>
      {
        this.projects=data;
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

  createProject()
  {
    this.router.navigate(["/project"], { queryParams: { editMode: 'true' } });
  }

  deleteProject(id: number)
  {
    this.projectService.deleteProject('http://localhost:8010/proxy/api/v1/project/delete/'+id).subscribe(
      data=>
      {
        this.getProjects();
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );
  }

  editProject(id: number)
  {
    this.router.navigate(["/project/" + id], { queryParams: { editMode: 'true' } });
  }
}

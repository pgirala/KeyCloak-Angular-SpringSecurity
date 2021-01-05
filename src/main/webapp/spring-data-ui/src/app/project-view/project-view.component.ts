import {Component, OnInit} from "@angular/core";
import {FormBuilder} from "@angular/forms";
import {ActivatedRoute, Router} from "@angular/router";
import {NgxSpinnerService} from "ngx-spinner";
import {Project} from "src/app/project-list/project";
import {ProjectService} from "src/app/project-list/project.service";

@Component({
  selector: 'app-project-view',
  templateUrl: './project-view.component.html',
  styleUrls: ['./project-view.component.css']
})
export class ProjectViewComponent implements OnInit
{
  project: Project;
  editMode: boolean=false;

  projectForm = this.formBuilder.group({
    id: [{disabled: true}],
    name: [''],
    location: [''],
    budget: [''],
  });


  constructor(private projectService:ProjectService,
              private formBuilder:FormBuilder,
              private activatedRoute:ActivatedRoute,
              private router:Router,
              private ngxSpinnerService:NgxSpinnerService)
  { }

  ngOnInit()
  {
    this.getProjectDetails();
  }

  private getProjectDetails()
  {
    let id=this.activatedRoute.snapshot.params.id;

    this.ngxSpinnerService.show();
    this.projectService.getProjectById('http://localhost:8081/api/v1/project/find/'+id).subscribe(
      data=>
      {
        this.project=data;
        this.projectForm.patchValue(
          {
            id: data.id,
            name: data.name,
            location: data.location,
            budget: data.budget,
          });
        this.ngxSpinnerService.hide();
        this.activatedRoute.snapshot.params.editMode=='true'?this.editMode=true:this.editMode=false;
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );
  }

  editProject()
  {
    this.editMode=true;
  }

  updateProject()
  {
    this.ngxSpinnerService.show();

    console.info(this.projectForm.value);
    let project=this.projectForm.value;

    this.projectService.updateProject('http://localhost:8081/api/v1/project/update', project).subscribe(
      data=>
      {
        this.project=data;
        this.projectForm.patchValue(
          {
            id: data.id,
            name: data.name,
            location: data.location,
            budget: data.budget,
          });
        this.editMode=false;

        this.ngxSpinnerService.hide();
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );

  }

  cancelUpdate()
  {
    this.editMode=false;
  }
}

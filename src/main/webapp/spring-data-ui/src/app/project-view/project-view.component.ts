import {Component, OnInit, EventEmitter, ViewChild} from "@angular/core";
import {FormBuilder} from "@angular/forms";
import {ActivatedRoute, Router} from "@angular/router";
import {NgxSpinnerService} from "ngx-spinner";
import {Project} from "src/app/project-list/project";
import {ProjectService} from "src/app/project-list/project.service";
import { FormioComponent } from 'angular-formio';

@Component({
  selector: 'app-project-view',
  templateUrl: './project-view.component.html',
  styleUrls: ['./project-view.component.css']
})
export class ProjectViewComponent implements OnInit
{
  @ViewChild(FormioComponent, {static: true}) formioComponent: FormioComponent;
  project: Project;
  editMode: boolean=false; // a eliminar, ya no sirve
  readOnly: boolean=!(this.activatedRoute.snapshot.queryParams.editMode=='true');
  triggerRefresh: any=new EventEmitter();
  myForm: any=JSON.parse(`{
    "display": "form",
    "settings": {
    },
    "components": [
        {
            "legend": "Project",
            "key": "fieldset",
            "type": "fieldset",
            "label": "",
            "input": false,
            "tableView": false,
            "components": [
                {
                    "label": "Id",
                    "hidden": true,
                    "hideLabel": true,
                    "tableView": true,
                    "key": "id",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "Name",
                    "tableView": true,
                    "key": "name",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "Location",
                    "tableView": true,
                    "key": "location",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "Budget",
                    "tableView": true,
                    "key": "budget",
                    "type": "textfield",
                    "input": true
                }
            ]
        },
        {
            "type": "button",
            "label": "Submit",
            "key": "submit",
            "disableOnInvalid": true,
            "input": true,
            "tableView": false
        }
    ]
  }`);

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

  onChange(event) {
    // de momento nada
  }

  onSubmit(event) {
    alert(JSON.stringify(event));
  }

  private getProjectDetails()
  {
    let id=this.activatedRoute.snapshot.params.id;

    this.ngxSpinnerService.show();
    this.projectService.getProjectById('http://localhost:8081/api/v1/project/find/'+id).subscribe(
      data=>
      {
        this.triggerRefresh.emit({
          property: 'submission',
          value: JSON.parse('{"data":' + JSON.stringify(data) + '}')
        });
        //(new Formio("")).loadForm().then((form) => this.triggerRefresh.emit({ form }));
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

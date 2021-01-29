import {Component, OnInit, EventEmitter} from "@angular/core";
import {FormBuilder} from "@angular/forms";
import {ActivatedRoute, Router} from "@angular/router";
import {NgxSpinnerService} from "ngx-spinner";
import {Project} from "src/app/project-list/project";
import {ProjectService} from "src/app/project-list/project.service";
import {KeycloakService} from "../keycloak/keycloak.service";

@Component({
  selector: 'app-project-view',
  templateUrl: './project-view.component.html',
  styleUrls: ['./project-view.component.css']
})
export class ProjectViewComponent implements OnInit
{
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
                },
                {
                  "type": "select",
                  "label": "Employees",
                  "widget": "choicesjs",
                  "tableView": true,
                  "multiple": true,
                  "dataSrc": "url",
                  "data": {
                    "url": "http://localhost:8010/proxy/api/v1/employee/list",
                    "headers": [
                      {
                        "key": "Authorization",
                        "value": "{{ metadata.token }}"
                      }
                    ]
                  },
                  "valueProperty": "id",
                  "key": "employees",
                  "indexeddb": {
                    "filter": {}
                  },
                  "input": true,
                  "disableLimit": false,
                  "lazyLoad": true
                }
            ]
        },
        {
            "type": "button",
            "label": "Submit",
            "key": "submit",
            "customConditional": "show = !instance.options.readOnly",
            "disableOnInvalid": true,
            "input": true,
            "tableView": false
        }
    ]
  }`);

  constructor(private projectService:ProjectService,
              private formBuilder:FormBuilder,
              private activatedRoute:ActivatedRoute,
              private router:Router,
              private ngxSpinnerService:NgxSpinnerService,
              private kcService: KeycloakService)
  { }

  ngOnInit()
  {
    this.getProjectDetails();
  }

  onChange(event) {
    // de momento nada
  }

  onSubmit(event) {
    let project = event.data;
    if (project.id)
      this.updateProject(project);
    else
      this.createProject(project);
  }

  private refreshForm(data:any)
  {
    this.triggerRefresh.emit({
      property: 'submission',
      value: JSON.parse('{"data":' + JSON.stringify(data) +
                          ', "metadata":{"token":"' + this.kcService.getAuthHeader() + '"}}')
    });
  }

  private getProjectDetails()
  {
    let id=this.activatedRoute.snapshot.params.id;

    this.ngxSpinnerService.show();
    this.projectService.getProjectById('http://localhost:8010/proxy/api/v1/project/find/'+id).subscribe(
      data=>
      {
        this.refreshForm(data);
        this.ngxSpinnerService.hide();
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );
  }

  createProject(project: Project)
  {
    this.ngxSpinnerService.show();

    this.projectService.createProject('http://localhost:8010/proxy/api/v1/project/create',project).subscribe(
      data=>
      {
        this.refreshForm(data); // importante ya que incluye el id
        this.ngxSpinnerService.hide();
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );
  }

  updateProject(project: Project)
  {
    this.ngxSpinnerService.show();

    this.projectService.updateProject('http://localhost:8010/proxy/api/v1/project/update', project).subscribe(
      data=>
      {
        this.refreshForm(data); // en realidad no es necesario
        this.ngxSpinnerService.hide();
      },
      error1 =>
      {
        this.ngxSpinnerService.hide();
      }
    );
  }
}

import {Component, OnInit, EventEmitter} from "@angular/core";
import {FormBuilder} from "@angular/forms";
import {ActivatedRoute, Router} from "@angular/router";
import {NgxSpinnerService} from "ngx-spinner";
import {Project} from "src/app/project-list/project";
import {Employee} from "src/app/employee-list/employee";
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
  firstSubmission: any=this.addToken('{}');
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
                  "label": "Employees",
                  "widget": "choicesjs",
                  "uniqueOptions": true,
                  "tableView": true,
                  "multiple": true,
                  "dataSrc": "url",
                  "data": {
                    "url": "http://localhost:8010/proxy/api/v1/employee/list",
                    "headers": [
                      {
                        "key": "Authorization",
                        "value": "{{ data.token }}"
                      }
                    ]
                  },
                  "valueProperty": "id",
                  "template": "<span>{{ item.firstName }} {{ item.lastName }}</span>",
                  "selectThreshold": 0.3,
                  "key": "employees",
                  "type": "select",
                  "indexeddb": {
                    "filter": {}
                  },
                  "uniqueValues": true,
                  "input": true
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
    let project = this.fromView2Data(event.data);

    if (project.id)
      this.updateProject(project);
    else
      this.createProject(project);
  }

  private addToken(serializedData:string) {
    let tokenData = '{"token":"' + this.kcService.getAuthHeader() + '"' + (serializedData.length > 2 ? ',' : '') +
                  serializedData.substring(1, serializedData.length);
    return JSON.parse('{"data":' + tokenData + '}');
  }

  private fromData2View(data:any)
  {
    let result = '{"id":' + data.id + ', '
              + '"name":"' + data.name + '", '
              + '"location":"' + data.location + '", '
              + '"budget":"' + data.budget + '", "employees":[';
    let ids = '';
    data.employees.forEach(function (value) {
      ids = ids + value.id + ","
    });
    if (ids.length > 0)
      ids = ids.substring(0, ids.length - 1)
    result = result + ids + ']}'
    return result
  }

  private fromView2Data(dataView:any)
  {
    let project = new Project();
    project.id = dataView.id;
    project.name = dataView.name;
    project.location = dataView.location;
    project.budget = dataView.budget;
    project.employees = new Array();
    dataView.employees.forEach(function (value) {
      let employee = new Employee();
      employee.id = value;
      project.employees.push(employee);
    })
    return project;
  }

  private refreshForm(data:any)
  {
    let serializedData = this.fromData2View(data);
    this.triggerRefresh.emit({
      property: 'submission',
      value: this.addToken(serializedData)
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

import {Component, OnInit, EventEmitter} from "@angular/core";
import {FormBuilder} from "@angular/forms";
import {ActivatedRoute, Router} from "@angular/router";
import {NgxSpinnerService} from "ngx-spinner";
import {Department} from "src/app/department-list/department";
import {Employee} from "src/app/employee-list/employee";
import {DepartmentService} from "src/app/department-list/department.service";
import {KeycloakService} from "../keycloak/keycloak.service";

@Component({
  selector: 'app-department-view',
  templateUrl: './department-view.component.html',
  styleUrls: ['./department-view.component.css']
})
export class DepartmentViewComponent implements OnInit
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
            "legend": "Department",
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

  constructor(private departmentService:DepartmentService,
              private formBuilder:FormBuilder,
              private activatedRoute:ActivatedRoute,
              private router:Router,
              private ngxSpinnerService:NgxSpinnerService,
              private kcService: KeycloakService)
  { }

  ngOnInit()
  {
    this.getDepartmentDetails();
  }

  onChange(event) {
    // de momento nada
  }

  onSubmit(event) {
    let department = this.fromView2Data(event.data);

    if (department.id)
      this.updateDepartment(department);
    else
      this.createDepartment(department);
  }

  private addToken(serializedData:string) {
    let tokenData = '{"token":"' + this.kcService.getAuthHeader() + '"' + (serializedData.length > 2 ? ',' : '') +
                  serializedData.substring(1, serializedData.length);
    return JSON.parse('{"data":' + tokenData + '}');
  }

  private fromData2View(data:any)
  {
    return '{"id":' + data.id + ', '
              + '"name":"' + data.name + '"}';
  }

  private fromView2Data(dataView:any)
  {
    let department = new Department();
    department.id = dataView.id;
    department.name = dataView.name;
    return department;
  }

  private refreshForm(data:any)
  {
    let serializedData = this.fromData2View(data);
    this.triggerRefresh.emit({
      property: 'submission',
      value: this.addToken(serializedData)
    });
  }

  private getDepartmentDetails()
  {
    let id=this.activatedRoute.snapshot.params.id;

    this.ngxSpinnerService.show();
    this.departmentService.getDepartmentById('http://localhost:8010/proxy/api/v1/department/find/'+id).subscribe(
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

  createDepartment(department: Department)
  {
    this.ngxSpinnerService.show();

    this.departmentService.createDepartment('http://localhost:8010/proxy/api/v1/department/create',department).subscribe(
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

  updateDepartment(department: Department)
  {
    this.ngxSpinnerService.show();

    this.departmentService.updateDepartment('http://localhost:8010/proxy/api/v1/department/update', department).subscribe(
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

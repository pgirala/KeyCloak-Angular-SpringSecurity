import {Component, OnInit, EventEmitter} from "@angular/core";
import {FormBuilder} from "@angular/forms";
import {ActivatedRoute, Router} from "@angular/router";
import {NgxSpinnerService} from "ngx-spinner";
import {Employee} from "src/app/employee-list/employee";
import {Department} from "src/app/department-list/department";
import {EmployeeService} from "src/app/employee-list/employee.service";
import {KeycloakService} from "../keycloak/keycloak.service";

@Component({
  selector: 'app-employee-view',
  templateUrl: './employee-view.component.html',
  styleUrls: ['./employee-view.component.css']
})
export class EmployeeViewComponent implements OnInit
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
            "legend": "Employee",
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
                    "label": "EmployeeId",
                    "tableView": true,
                    "key": "employeeId",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "First name",
                    "tableView": true,
                    "key": "firstName",
                    "type": "textfield",
                    "input": true
                },
                {
                  "label": "Last name",
                  "tableView": true,
                  "key": "lastName",
                  "type": "textfield",
                  "input": true
                },
                {
                  "label": "Email",
                  "tableView": true,
                  "key": "email",
                  "type": "textfield",
                  "input": true
                },
                {
                  "label": "Phone",
                  "tableView": true,
                  "key": "phone",
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
                  "label": "Salary",
                  "tableView": true,
                  "key": "salary",
                  "type": "textfield",
                  "input": true
                },
                {
                  "label": "Department",
                  "widget": "choicesjs",
                  "uniqueOptions": true,
                  "tableView": true,
                  "multiple": false,
                  "dataSrc": "url",
                  "data": {
                    "url": "http://localhost:8010/proxy/api/v1/department/list",
                    "headers": [
                      {
                        "key": "Authorization",
                        "value": "{{ data.token }}"
                      }
                    ]
                  },
                  "valueProperty": "id",
                  "template": "<span>{{ item.name }}</span>",
                  "selectThreshold": 0.3,
                  "key": "department",
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

  constructor(private employeeService:EmployeeService,
              private formBuilder:FormBuilder,
              private activatedRoute:ActivatedRoute,
              private router:Router,
              private ngxSpinnerService:NgxSpinnerService,
              private kcService: KeycloakService)
  { }

  ngOnInit()
  {
    this.getEmployeeDetails();
  }

  onChange(event) {
    // de momento nada
  }

  onSubmit(event) {
    let employee = this.fromView2Data(event.data);

    if (employee.id)
      this.updateEmployee(employee);
    else
      this.createEmployee(employee);
  }

  private addToken(serializedData:string) {
    let tokenData = '{"token":"' + this.kcService.getAuthHeader() + '"' + (serializedData.length > 2 ? ',' : '') +
                  serializedData.substring(1, serializedData.length);
    return JSON.parse('{"data":' + tokenData + '}');
  }

  private fromData2View(data:any)
  {
    let result = '{"id":' + data.id + ', '
              + '"employeeId":"' + data.employeeId + '", '
              + '"firstName":"' + data.firstName + '", '
              + '"lastName":"' + data.lastName + '", '
              + '"email":"' + data.email + '", '
              + '"phone":"' + data.phone + '", '
              + '"location":"' + data.location + '", '
              + '"salary":"' + data.salary + '"';
    if (data.department)
              result = result + ', "department":' + data.department.id;
    result = result + '}';
    return result
  }

  private fromView2Data(dataView:any)
  {
    let employee = new Employee();
    employee.id = dataView.id;
    employee.employeeId = dataView.employeeId;
    employee.firstName = dataView.firstName;
    employee.lastName = dataView.lastName;
    employee.email = dataView.email;
    employee.phone = dataView.phone;
    employee.location = dataView.location;
    employee.salary = dataView.salary;

    if (dataView.department) {
      let department = new Department();
      department.id = dataView.department;
      employee.department = department;
    }

    return employee;
  }

  private refreshForm(data:any)
  {
    let serializedData = this.fromData2View(data);
    this.triggerRefresh.emit({
      property: 'submission',
      value: this.addToken(serializedData)
    });
  }

  private getEmployeeDetails()
  {
    let id=this.activatedRoute.snapshot.params.id;

    this.ngxSpinnerService.show();
    this.employeeService.getEmployeeById('http://localhost:8010/proxy/api/v1/employee/find/'+id).subscribe(
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

  createEmployee(employee: Employee)
  {
    this.ngxSpinnerService.show();

    this.employeeService.createEmployee('http://localhost:8010/proxy/api/v1/employee/create',employee).subscribe(
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

  updateEmployee(employee: Employee)
  {
    this.ngxSpinnerService.show();

    this.employeeService.updateEmployee('http://localhost:8010/proxy/api/v1/employee/update', employee).subscribe(
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

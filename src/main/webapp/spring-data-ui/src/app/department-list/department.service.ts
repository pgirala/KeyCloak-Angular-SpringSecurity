import {HttpClient} from "@angular/common/http";
import {Injectable} from "@angular/core";
import {Department} from "./department";

@Injectable({
  providedIn: 'root'
})
export class DepartmentService {

  constructor(private httpClient:HttpClient) { }

  getDepartments(url:string)
  {
    return this.httpClient.get<Department[]>(url);
  }

  getDepartmentById(url:string)
  {
    return this.httpClient.get<Department>(url);
  }

  updateDepartment(url: string, department: Department)
  {
    return this.httpClient.post<Department>(url,department);
  }

  createDepartment(url: string, department: Department)
  {
    return this.httpClient.post<Department[]>(url, department);
  }

  deleteDepartment(url: string)
  {
    return this.httpClient.delete(url);
  }
}

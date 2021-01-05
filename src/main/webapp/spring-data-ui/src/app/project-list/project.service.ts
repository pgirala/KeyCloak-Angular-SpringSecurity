import {HttpClient} from "@angular/common/http";
import {Injectable} from "@angular/core";
import {Project} from "./project";

@Injectable({
  providedIn: 'root'
})
export class ProjectService {

  constructor(private httpClient:HttpClient) { }

  getProjects(url:string)
  {
    return this.httpClient.get<Project[]>(url);
  }

  getProjectById(url:string)
  {
    return this.httpClient.get<Project>(url);
  }

  updateProject(url: string, project: Project)
  {
    return this.httpClient.post<Project>(url,project);
  }

  createProject(url: string, project: Project)
  {
    return this.httpClient.post<Project[]>(url, project);
  }

  deleteProject(url: string)
  {
    return this.httpClient.delete(url);
  }
}

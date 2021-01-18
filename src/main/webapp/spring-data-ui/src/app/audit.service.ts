import {HttpClient} from "@angular/common/http";
import { Injectable } from '@angular/core';
import {Change} from "./change";

@Injectable({
  providedIn: 'root'
})
export class AuditService {

  constructor(private httpClient:HttpClient) { }

  getChanges(url:string)
  {
    return this.httpClient.get<Change[]>(url);
  }
}

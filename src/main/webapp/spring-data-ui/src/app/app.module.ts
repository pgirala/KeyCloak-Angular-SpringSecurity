import {HTTP_INTERCEPTORS, HttpClientModule} from "@angular/common/http";
import {APP_INITIALIZER, NgModule} from "@angular/core";
import {ReactiveFormsModule} from "@angular/forms";
import {BrowserModule} from "@angular/platform-browser";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import {NgxSpinnerModule} from "ngx-spinner";

import {AppRoutingModule} from "./app-routing.module";
import {AppComponent} from "./app.component";
import {EmployeeListComponent} from "./employee-list/employee-list.component";
import {EmployeeProjectComponent} from "./employee-project/employee-project.component";
import {EmployeeViewComponent} from "./employee-view/employee-view.component";
import {TokenInterceptor} from "./interceptors/token-interceptor";
import {KeycloakService} from "./keycloak/keycloak.service";
import {LogoutComponent} from "./logout/logout.component";

import { FormioModule } from 'angular-formio';
import { ProjectListComponent } from './project-list/project-list.component';
import { ProjectViewComponent } from './project-view/project-view.component';
import { OAuthModule, OAuthStorage  } from 'angular-oauth2-oidc';
import { DepartmentListComponent } from './department-list/department-list.component';
import { DepartmentViewComponent } from './department-view/department-view.component';

export function kcFactory(keycloakService: KeycloakService) {
  return () => keycloakService.init();
}
@NgModule({
  declarations: [
    AppComponent,
    EmployeeListComponent,
    LogoutComponent,
    EmployeeProjectComponent,
    EmployeeViewComponent,
    ProjectListComponent,
    ProjectViewComponent,
    DepartmentListComponent,
    DepartmentViewComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    AppRoutingModule,
    HttpClientModule,
    OAuthModule.forRoot({
      resourceServer: {
          allowedUrls: ['http://localhost:8010/proxy/api'],
          sendAccessToken: true
      }
    }),
    NgxSpinnerModule,
    FormioModule
  ],
  providers: [KeycloakService,
    {
      provide: APP_INITIALIZER,
      useFactory: kcFactory,
      deps: [KeycloakService],
      multi: true
    },
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true
    },
    { provide: OAuthStorage, useValue: localStorage }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { AuthConfig } from 'angular-oauth2-oidc';

export const authCodeFlowConfig: AuthConfig = {
  issuer: 'http://localhost:8080/auth/realms/spring-boot-quickstart',
  redirectUri: window.location.origin,
  clientId: 'angular-app',
  responseType: 'code',
  scope: 'openid profile email offline_access',
  showDebugInformation: true,
  timeoutFactor: 0.01
};

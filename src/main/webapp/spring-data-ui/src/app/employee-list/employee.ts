import { Department } from "../department-list/department";

export class Employee
{
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  employeeId: number;
  location: string;
  salary: number;
  department: Department;
}

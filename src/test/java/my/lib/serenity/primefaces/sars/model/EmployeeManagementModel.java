package my.lib.serenity.primefaces.sars.model;

/**
 * Created by ngoc on 05/10/2016.
 */
public class EmployeeManagementModel {

    private String empName;
    private String hireDate;
    private String status;
    private String baseLocation;
    private String position;
    private String authority;
    private String email;
    private String tel;
    private String mobile;

    public EmployeeManagementModel(String empName, String hireDate, String status, String baseLocation, String position, String authority, String email, String tel, String mobile) {
        this.empName = empName;
        this.hireDate = hireDate;
        this.status = status;
        this.baseLocation = baseLocation;
        this.position = position;
        this.authority = authority;
        this.email = email;
        this.tel = tel;
        this.mobile = mobile;
    }

    public EmployeeManagementModel(String empName, String hireDate, String status, String baseLocation, String position, String authority, String email) {
        this.empName = empName;
        this.hireDate = hireDate;
        this.status = status;
        this.baseLocation = baseLocation;
        this.position = position;
        this.authority = authority;
        this.email = email;
    }

    public EmployeeManagementModel(String tel, String mobile) {
        this.tel = tel;
        this.mobile = mobile;
    }

    public EmployeeManagementModel() {
        
    }

    public String getEmpName() {
        return this.empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getHireDate() {
        return this.hireDate;
    }

    public void setHireDate(String hireDate) {
        this.hireDate = hireDate;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBaseLocation() {
        return this.baseLocation;
    }

    public void setBaseLocation(String baseLocation) {
        this.baseLocation = baseLocation;
    }

    public String getPosition() {
        return this.position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getAuthority() {
        return this.authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return this.tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getMobile() {
        return this.mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }



}

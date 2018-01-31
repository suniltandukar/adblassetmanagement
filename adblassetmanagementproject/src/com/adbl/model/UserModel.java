package com.adbl.model;

public class UserModel {
	String username, password, status,userid,givenrole,fullName,post,staffCode,endDate,startDate,roleName,functionAllowed,functionRestriction,branchAllowed,branchAllowedFunctions,additionalFunctions;
	
	String branchCode,branchName;
	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getAdditionalFunctions() {
		return additionalFunctions;
	}

	public void setAdditionalFunctions(String additionalFunctions) {
		this.additionalFunctions = additionalFunctions;
	}
	

	public String getBranchAllowedFunctions() {
		return branchAllowedFunctions;
	}

	public void setBranchAllowedFunctions(String branchAllowedFunctions) {
		this.branchAllowedFunctions = branchAllowedFunctions;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getStaffCode() {
		return staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getFunctionAllowed() {
		return functionAllowed;
	}

	public void setFunctionAllowed(String functionAllowed) {
		this.functionAllowed = functionAllowed;
	}

	public String getFunctionRestriction() {
		return functionRestriction;
	}

	public void setFunctionRestriction(String functionRestriction) {
		this.functionRestriction = functionRestriction;
	}

	public String getBranchAllowed() {
		return branchAllowed;
	}

	public void setBranchAllowed(String branchAllowed) {
		this.branchAllowed = branchAllowed;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getGivenrole() {
		return givenrole;
	}

	public void setGivenrole(String givenrole) {
		this.givenrole = givenrole;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}

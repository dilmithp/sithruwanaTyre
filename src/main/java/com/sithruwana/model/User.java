package com.sithruwana.model;

public class User {
    private int userId;
    private String username;
    private String email;
    private String password;
    private String contactNo;
    private String role;
    
    // Default constructor
    public User() {
    }
    
    // Parameterized constructor
    public User(String username, String email, String password, String contactNo, String role) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.contactNo = contactNo;
        this.role = role;
    }
    
    // Constructor with userId
    public User(int userId, String username, String email, String password, String contactNo, String role) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.password = password;
        this.contactNo = contactNo;
        this.role = role;
    }
    
    // Getters and Setters
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getContactNo() {
        return contactNo;
    }
    
    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }
    
    public String getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
}
